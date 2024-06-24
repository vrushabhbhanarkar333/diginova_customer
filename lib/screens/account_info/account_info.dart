import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:diginova/controller/account_info_controller.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/provider/my_details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/generate_image_url.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final AccountInfoController _accountInfoController = AccountInfoController();
  XFile? _imageFile;
  String finalFileName = "";

  Future<ImageSource?> _pickImage() async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );
    return source;
  }

  Future<void> _getImageFile(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: source,
      );
      if (pickedFile != null) {
        final fileExtension = path.extension(pickedFile.path);
        final fileName = createUniqueS3FilenameWithDate(pickedFile.name);

        final generateImageUrl = GenerateImageUrl();
        final uploadFile =
            await generateImageUrl.call(fileName, fileExtension, pickedFile);

        log('Upload status: $uploadFile');

        setState(() {
          _imageFile = pickedFile;
          finalFileName = fileName;
        });
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      // Handle permission denial if needed
      return;
    }
  }

  String userName = "";
  String role = "";
  String email = "";
  String selectedGender = 'Select Gender';
  bool _isLoading = false;
  String department = '';
  String? preProfileImage;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _populateTextFields();
  }

  Future<void> _loadUsername() async {
    final userInfo = await UserDataManager.getLoginInfo();
    setState(() {
      role = userInfo["role"] ?? "";
    });
  }

  void _populateTextFields() {
    final userprovider = Provider.of<MyDetailsProvider>(context, listen: false);
    final data = userprovider.myData;

    _accountInfoController.firstnameController.text = data['firstName'] ?? '';
    _accountInfoController.lastnameController.text = data['lastName'] ?? '';
    _accountInfoController.dobController.text = data['dob']?.toString() ?? '';
    email = data['email'] ?? '';
    selectedGender = (data['gender'] == null || data['gender'] == '')
        ? 'Select Gender'
        : data['gender'];
    preProfileImage = data['profileImage'] ?? '';
  }

  Future<void> _updateUserProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userData = await UserDataManager.getLoginInfo();
      final jwtToken = userData['jwtToken'] ?? '';
      final uid = userData['uid'] ?? '';

      final userDetails = {
        "firstName": _accountInfoController.firstnameController.text,
        "lastName": _accountInfoController.lastnameController.text,
        "dob": _accountInfoController.dobController.text,
        "gender": selectedGender,
        "qualification": _accountInfoController.qualificationController.text,
        "experience": _accountInfoController.experienceController.text,
        "profileImage": finalFileName
      };

      final response = await http.put(
        Uri.parse('${BASE_URL}user/$uid'),
        headers: {
          'Authorization': 'Bearer $jwtToken',
          'accept': 'text/plain',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userDetails),
      );

      if (response.statusCode == 200) {
        _accountInfoController.updateSuccess();
      } else {
        log('Failed to update profile');
        log(response.body);
      }
    } catch (error) {
      log('Error: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          AppBarNova(
            title: "Add Your Details",
            fontWeight: FontWeight.w600,
            fontSize: FONT_20,
            color: BLACK_CLR_SHADE,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 125, left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          height: 140,
                          width: 140,
                          child: CircleAvatar(
                            backgroundImage: _imageFile != null
                                ? FileImage(File(_imageFile!.path))
                                : preProfileImage != null
                                    ? NetworkImage(
                                        '$IMAGE_BASE_URL$preProfileImage')
                                    : const AssetImage(
                                            'assets/images/ProfilePic.png')
                                        as ImageProvider<Object>,
                          ),
                        ),
                        Positioned(
                          bottom: -25,
                          left: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: WHITE_SHADE_CLR,
                            ),
                            height: 40,
                            width: 40,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icons/trash-alt.png',
                                height: 20,
                                width: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACING_LG),
                  Center(
                    child: SizedBox(
                      height: mediaQueryH(context) * 0.05,
                      width: mediaQueryW(context) * 0.7,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            BTN_BLUE_CLR,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await _requestStoragePermission();
                          final source = await _pickImage();
                          if (source != null) {
                            await _getImageFile(source);
                          }
                        },
                        child: Text(
                          "Change Picture",
                          style: GoogleFonts.poppins(
                            fontSize: FONT_14,
                            fontWeight: FontWeight.bold,
                            color: WHITE_SHADE_CLR,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_LG),
                  _buildTextField(
                      'First Name',
                      _accountInfoController.firstnameController,
                      Icons.person_2_outlined),
                  _buildTextField(
                      'Last Name', _accountInfoController.lastnameController),
                  _buildDisplayField(
                      'Email', email, 'assets/icons/Vector (3).png'),
                  _buildDisplayField(
                      'Role', role, 'assets/icons/Vector (3).png'),
                  _buildDisplayField(
                      'Department', department, 'assets/icons/Vector (3).png'),
                  _buildTextField(
                      'Date of Birth', _accountInfoController.dobController),
                  _buildTextField('Experience',
                      _accountInfoController.experienceController),
                  _buildDropdownField(
                      'Gender',
                      ['Select Gender', 'Male', 'Female', 'Other'],
                      selectedGender),
                  const SizedBox(height: SPACING_MD),
                  SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          BTN_BLUE_CLR,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await _updateUserProfile();
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: WHITE_SHADE_CLR)
                          : Text(
                              "Update",
                              style: GoogleFonts.poppins(
                                fontSize: FONT_14,
                                fontWeight: FontWeight.bold,
                                color: WHITE_SHADE_CLR,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      [IconData? icon]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: FONT_14,
              fontWeight: FontWeight.w500,
              color: BLACK_CLR_SHADE),
        ),
        const SizedBox(height: SPACING_XS),
        TextField(
          style: TEXT_STYLE,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: BTN_BLUE_CLR) : null,
            filled: true,
            fillColor: WHITE_CLR,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
        ),
        const SizedBox(height: SPACING_MD),
      ],
    );
  }

  Widget _buildDisplayField(String label, String value, String iconPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: FONT_14,
              fontWeight: FontWeight.w500,
              color: BLACK_CLR_SHADE),
        ),
        const SizedBox(height: SPACING_XS),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: WHITE_CLR,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Image.asset(iconPath, height: 20, width: 20),
              const SizedBox(width: 10),
              Text(
                value,
                style: GoogleFonts.poppins(
                    fontSize: FONT_14,
                    fontWeight: FontWeight.w400,
                    color: BLACK_CLR),
              ),
            ],
          ),
        ),
        const SizedBox(height: SPACING_MD),
      ],
    );
  }

  Widget _buildDropdownField(
      String label, List<String> items, String? selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: FONT_14,
              fontWeight: FontWeight.w500,
              color: BLACK_CLR_SHADE),
        ),
        const SizedBox(height: SPACING_XS),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: WHITE_CLR,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          ),
          value: selectedValue,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedGender = value!;
            });
          },
        ),
        const SizedBox(height: SPACING_MD),
      ],
    );
  }
}
