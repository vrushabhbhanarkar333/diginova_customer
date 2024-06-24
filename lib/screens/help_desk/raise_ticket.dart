import 'dart:convert';
import 'dart:developer';
import 'package:diginova/global/utility.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:diginova/screens/help_desk/my_tickets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:diginova/controller/help_desk_controller/raise_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:diginova/global/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import '../../global/generate_image_url.dart';
import '../../provider/raise_ticket.dart';

class RaiseTicket extends StatefulWidget {
  const RaiseTicket({
    super.key,
  });

  @override
  State<RaiseTicket> createState() => _RaiseTicketState();
}

class _RaiseTicketState extends State<RaiseTicket> {
  String? priorityType;
  late String createdFor = '';
  String? imageUrl = '';
  bool _isLoading = false;
  String? imagePath;
  List<Map<String, String>> userNames = [];
  String selectedName = ''; // Default value
  String selectedUserId = '';
  late TicketProvider _ticketProvider;
  final RaiseController _raiseController = Get.put(RaiseController());
  late String hintText = 'Select name'; // Hint text variable
  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _fetchTickets();
    _ticketProvider = Provider.of<TicketProvider>(context, listen: false);
    // _pickImage();
  }

  FilePickerResult? selectedFiles;

  @override
  void dispose() {
    // Clean up any resources or controllers here if necessary
    // For example, if you have a TextEditingController, you should dispose of it here
    // _controller.dispose();
    super.dispose();
  }

  void _fetchUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';

      final String apiUrl = '${BASE_URL}user/';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body); // Parse JSON response
        log('$data');
        List<Map<String, String>> names = [];
        for (var user in data) {
          String firstName = user['firstName'] ?? '';
          String lastName = user['lastName'] ?? '';
          String fullName = firstName.isNotEmpty && lastName.isNotEmpty
              ? '$firstName $lastName'
              : user['email'];

          const int maxLength = 20;
          if (fullName.length > maxLength) {
            fullName = '${fullName.substring(0, maxLength)}...';
          }
          names.add({"id": user['_id'], "fullName": fullName});
        }

        if (names.isNotEmpty) {
          setState(() {
            userNames = names;
            selectedUserId = names[0]['id']!;
            selectedName = names[0]['fullName']!;
          });
        }
      } else {
        log('Failed to load user data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching user data: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String getIdForName(String name) {
    for (var map in userNames) {
      if (map['fullName'] == name) {
        return map['id']!;
      }
    }
    return '';
  }

  Future<void> _createTicket() async {
    _ticketProvider.setLoading(true);

    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    String jwtToken = userData['jwtToken'] ?? '';
    String firstName = userData['name']!.split(" ")[0] ?? '';
    String lastName = userData['name']!.split(" ")[1] ?? '';

    final url = Uri.parse('${BASE_URL}raise/tickets');
    String? fileName;
    if (selectedFiles != null) {
      fileName = await _uploadFile(selectedFiles!.files);
    }

    final response = await http.post(
      url,
      headers: <String, String>{
        'accept': 'text/plain',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwtToken',
      },
      body: json.encode({
        "subject": _raiseController.subjectController.text,
        "priority": priorityType,
        "message": _raiseController.descriptionController.text,
        "createdFor": selectedUserId,
        "image": fileName
      }),
    );

    if (response.statusCode == 201) {
      log("Ticket added successfully!");
      log(response.body);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Ticket created successfully!'),
      //     duration: Duration(seconds: 2),
      //   ),
      // );
      // Initialize _updatedBook with the new book data

      setState(() {
        _isLoading = false;
      });
      _ticketProvider.setLoading(false);

      _ticketProvider.addTicket({
        "subject": _raiseController.subjectController.text,
        "priority": priorityType,
        "message": _raiseController.descriptionController.text,
        "createdFor": {
          "firstName": selectedName.split(" ")[0],
          "lastName": selectedName.split(" ")[1]
        },
        "image": (imageUrl != "") ? imageUrl : "",
        "createdBy": {"firstName": firstName, "lastName": lastName},
        "createdDate": DateTime.now().toString(),
        // ... (other ticket details)
      });
      _raiseController.raiseTicket();

      // Notify listeners to trigger a rebuild
      // _ticketProvider.notifyListeners();

      // Navigate back to the previous screen
      // Navigator.pop(context);
    } else {
      setState(() {
        _isLoading = false;
      });
      log("Failed to add ticket. Status code: ${response.statusCode}");
      log("Response body: ${response.body}");
    }
  }

  Future<void> _fetchTickets() async {
    setState(() {});

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';
      String uid = userData['uid'] ?? '';
      // log(uid);

      final String apiUrl = '${BASE_URL}raise/tickets/my/';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        log(response.body);
        final List<dynamic> data = json.decode(response.body);

        // Explicitly cast List<dynamic> to List<Map<String, dynamic>>
        List<Map<String, dynamic>> ticketData =
            List<Map<String, dynamic>>.from(data);

        // Use Provider to update the ticket data
        // ignore: use_build_context_synchronously
        Provider.of<TicketProvider>(context, listen: false)
            .setTickets(ticketData);
      } else {
        log('Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching notifications: $error');
    }

    setState(() {});
  }

  // Future<ImageSource?> _pickImage() async {
  //   final source = await showDialog<ImageSource>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Select Image'),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: <Widget>[
  //             ListTile(
  //               leading: const Icon(Icons.camera_alt),
  //               title: const Text('Camera'),
  //               onTap: () => Navigator.pop(context, ImageSource.camera),
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_library),
  //               title: const Text('Gallery'),
  //               onTap: () => Navigator.pop(context, ImageSource.gallery),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  //   return source;
  // }

  // Future<XFile?> _getImageFile(BuildContext context, ImageSource source) async {
  //   try {
  //     XFile? image = await ImagePicker().pickImage(
  //       source: source,
  //     );
  //     if (image != null) {
  //       String fileExtension = path.extension(image.path);
  //       String fileName = createUniqueS3FilenameWithDate(image.name);

  //       GenerateImageUrl generateImageUrl = GenerateImageUrl();
  //       bool uploadFile =
  //           await generateImageUrl.call(fileName, fileExtension, image);

  //       log('Upload status: $uploadFile');
  //       if (uploadFile) {
  //         setState(() {
  //           // Update your state here
  //           // _photosUrls.add(generateImageUrl.downloadUrl);
  //           // log(generateImageUrl.downloadUrl);
  //           setState(() {
  //             imageUrl = fileName;
  //             // generateImageUrl.downloadUrl;
  //           });
  //         });
  //       }
  //     }

  //     return image;
  //   } catch (e) {
  //     log('Error picking image: $e');
  //     return null;
  //   }
  // }
  Future<String> _uploadFile(source) async {
    try {
      if (source != null) {
        final fileExtension = path.extension(source.path);
        String fileName = createUniqueS3FilenameWithDate(source.name);

        final generateImageUrl = GenerateImageUrl();
        final uploadFile = await generateImageUrl.callForMultiFile(
            fileName, fileExtension, source);

        log('Upload status: $uploadFile');

        return fileName;
      }
      return "";
    } catch (e) {
      log('Error picking image: $e');
      return 'Error picking image: $e';
    }
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      // Handle permission denial if needed
      return;
    }
  }

  void itemSubmitted(Map<String, String> item) {
    setState(() {
      selectedName = item['fullName']!;
      selectedUserId = item['id']!;
      // Update the hint text when an item is selected
      hintText = selectedName; // Modify this as per your needs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // padding:
                    //     const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                    // height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        color: WHITE_CLR),
                    child: AutoCompleteTextField<Map<String, String>>(
                      key: GlobalKey<
                          AutoCompleteTextFieldState<Map<String, String>>>(),
                      clearOnSubmit: false,
                      suggestions: userNames,
                      style: TEXT_STYLE.copyWith(
                        fontSize: FONT_XSS,
                        fontWeight: FontWeight.w400,
                        color: BLACK_CLR_SHADE,
                      ),
                      decoration: InputDecoration(
                        labelStyle: TEXT_STYLE,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none, // Remove the border
                        ),
                        hintText: hintText, // Use the dynamic hint text here
                      ),
                      itemFilter: (item, query) {
                        return item['fullName']!
                            .toLowerCase()
                            .contains(query.toLowerCase());
                      },
                      itemSorter: (a, b) {
                        return a['fullName']!.compareTo(b['fullName']!);
                      },
                      itemSubmitted: itemSubmitted,
                      itemBuilder: (context, item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              item['fullName']!,
                              style: TEXT_STYLE.copyWith(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w400,
                                color: BLACK_CLR_SHADE,
                              ),
                            ),
                          ),
                        );
                      },
                      minLength: 0, // Show suggestions without typing
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Text('Selected Name: $selectedName'),
                  // Text('Selected User ID: $selectedUserId'),

                  const SizedBox(height: SPACING_MD),

                  SizedBox(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      controller: _raiseController.subjectController,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: WHITE_CLR,
                        hintText: 'Subject',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: FONT_XSS,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR_SHADE,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.59),
                          ),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.59),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.59),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_MD),
                  SizedBox(
                    height: 96,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      controller: _raiseController.descriptionController,
                      maxLines: 96,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: WHITE_CLR,
                        hintText: 'Description',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: FONT_XSS,
                          fontWeight: FontWeight.w400,
                          color: BLACK_CLR_SHADE,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.59),
                          ),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.59),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFFE0E2E7),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.59),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_MD),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Priority type',
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //     DropdownButton<String>(
                  //       hint: Text(
                  //         'Select',
                  //         style: TEXT_STYLE,
                  //       ),
                  //       style: DROP_DOWN,
                  //       dropdownColor: Colors.grey.shade50,
                  //       value: priorityType,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           priorityType = value!;
                  //           // _fetchUserData();
                  //         });
                  //       },
                  //       items: [
                  //         'Low',
                  //         'Medium',
                  //         'High',
                  //       ]
                  //           .map((prioType) => DropdownMenuItem<String>(
                  //                 value: prioType,
                  //                 child: Text(prioType),
                  //               ))
                  //           .toList(),
                  //     ),
                  //   ],
                  // ),
                  DropdownButtonFormField<String>(
                    style: DROP_DOWN,
                    value: priorityType,
                    onChanged: (String? newValue) {
                      setState(() {
                        priorityType = newValue!;
                      });
                    },
                    items: <String>[
                      'Low',
                      'Medium',
                      'High',
                    ].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    decoration: InputDecoration(
                      labelStyle: TEXT_STYLE,
                      filled: true,
                      fillColor: WHITE_CLR,
                      hintText: 'Priority',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: FONT_XSS,
                        fontWeight: FontWeight.w400,
                        color: BLACK_CLR_SHADE,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFE0E2E7),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.59),
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFE0E2E7),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.59),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0XFFE0E2E7),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.59),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_MD),

                  // imageUrl != ""
                  //     ? Image.network(IMAGE_BASE_URL + imageUrl!)
                  //     : const SizedBox(),
                  // const SizedBox(height: SPACING_MD),

                  GestureDetector(
                    onTap: () async {
                      await _requestStoragePermission();
                      selectedFiles = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                      if (selectedFiles == null) {
                        log("No file selected");
                      } else {
                        setState(() {});
                        for (var element in selectedFiles!.files) {
                          log(element.name);
                        }
                      }
                      // final source = await _pickImage();
                      // if (source != null) {
                      //   final image = await _getImageFile(context, source);
                      // if (image != null) {
                      //   imagePath =
                      //       await _saveImageToAppDirectory(
                      //           image);
                      //   setState(
                      //       () {}); // Update UI with new image
                      // }
                      // }
                    },
                    child: Container(
                      height: 89,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: WHITE_CLR,
                        borderRadius: BorderRadius.circular(3.59),
                        border: Border.all(
                          color: const Color(0XFFE0E2E7),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: PADDING_SM,
                            vertical: PADDING_XS,
                          ),
                          child: DottedBorder(
                            color: BLUE__CLR,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(5.37),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/upload.png'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedFiles == null
                                          ? 'Select a file or drag and drop here'
                                          : selectedFiles!.files.first.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: FONT_XSS,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0XFF1E1E1E),
                                      ),
                                    ),
                                    selectedFiles == null
                                        ? Text(
                                            'JPG, XLSX or PDF, file size no \n  more than 10MB',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: FONT_XSS,
                                              fontWeight: FontWeight.w400,
                                              color: BLUE__CLR,
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_LG),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyTickets(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(BTN_BLUE_CLR),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.77),
                            ),
                          ),
                        ),
                        child: Text(
                          'My Tickets',
                          style: GoogleFonts.poppins(
                            fontSize: FONT_XSS,
                            fontWeight: FontWeight.w600,
                            color: WHITE_CLR,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              _raiseController.subjectController.clear();
                              _raiseController.descriptionController.clear();
                              _raiseController.forController.clear();
                            },
                            child: Text(
                              'Clear',
                              style: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w600,
                                color: BLACK_CLR_SHADE,
                              ),
                            ),
                          ),
                          Consumer<TicketProvider>(
                            builder: (context, ticketProvider, child) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (!ticketProvider.isLoading) {
                                    _createTicket();
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(BTN_BLUE_CLR),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.77),
                                    ),
                                  ),
                                ),
                                child: ticketProvider.isLoading
                                    ? Text(
                                        "Creating...",
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_XSS,
                                          fontWeight: FontWeight.w600,
                                          color: WHITE_CLR,
                                        ),
                                      )
                                    : Text(
                                        "Raise Ticket",
                                        style: GoogleFonts.poppins(
                                          fontSize: FONT_XSS,
                                          fontWeight: FontWeight.w600,
                                          color: WHITE_CLR,
                                        ),
                                      ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  // Text('Tickets', style: TEXT_STYLE_M_BOLD),
                  // const MyTickets()
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const MyTickets(),
                  //       ),
                  //     );
                  //   },
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all(BTN_BLUE_CLR),
                  //     shape: MaterialStateProperty.all(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(9.77),
                  //       ),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'My Tickets',
                  //     style: GoogleFonts.poppins(
                  //       fontSize: FONT_XSS,
                  //       fontWeight: FontWeight.w600,
                  //       color: WHITE_CLR,
                  //     ),
                  //   ),
                  // )
                ],
              ),
      ),
    );
  }
}
