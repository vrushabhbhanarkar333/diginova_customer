// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:diginova/controller/project_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/bottom_nav_bar.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final ProjectController projectController = Get.put(ProjectController());

  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    projectController.fetchCustomerData();
    _loadSelectedItem();
  }

  Future<void> _loadSelectedItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    _selectedItem = prefs.getString('selectedItem');
    debugPrint("selected item from shared prefs =${_selectedItem}");
    // });
  }

  Future<void> _saveSelectedItem(String selectedItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedItem', selectedItem);
  }

  void _validateAndPostProjectData(String qrCodeData) async {
    // Perform any validation if needed
    if (qrCodeData.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid QR Code data')),
      );
      return;
    }

    // Attempt to post the project data
    UpdateDataModel? result = await projectController.updateQrData(qrCodeData);
    // if (result != null) {
    if (qrCodeData != null) {
      // Navigate to the HomePage if successful
      _saveSelectedItem(qrCodeData);
      // _saveSelectedItem(result as String);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigationBarScreen(),
          //  ProjectDetailsScreen(
          //   selectedItem: _selectedItem ??
          //       qrCodeData, // Use scanned value if _selectedItem is null
          //   id: projectController.responseData['_id'] ?? '',
          //   cusId: projectController.responseData['customerId'] ?? '',
          //   noProjects: projectController.responseData['noProjects'],
          //   status: projectController.responseData['status'] ?? '',
          //   companyId: projectController.responseData['companyId'] ?? '',
          //   createdBy: projectController.responseData['createdBy'] ?? '',
          //   customerSince:
          //       projectController.responseData['customerSince'] ?? '',
          //   createdDate: projectController.responseData['createdDate'] ?? '',
          //   v: projectController.responseData['__v'],
          // ),
        ),
      );
    }

    // Set the scanned value to _selectedItem
    setState(() {
      _selectedItem = qrCodeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: mediaQueryH(context) * 0.1,
        centerTitle: true,
        // backgroundColor: ,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 18,
          ),
        ),
      ),
      body: FutureBuilder(
        future: projectController.fetchCustomerData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  BACKGROUNDIMAGE,
                  // color: const Color(0XFF404040),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        'Scan QR Code',
                        style: GoogleFonts.poppins(
                          fontSize: FONT_MD,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: SPACING_XS),
                      Text(
                        'Get started to know the \nprogress',
                        textAlign: TextAlign.center,
                        style: FONT_14_TXT_STYLE.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: SPACING_LG),
                      Container(
                        color: WHITE_CLR,
                        height: 253,
                        width: 250,
                        child: MobileScanner(
                          controller: MobileScannerController(
                            detectionSpeed: DetectionSpeed.noDuplicates,
                            returnImage: true,
                          ),
                          // onDetect: (capture) {
                          //   List<Barcode> barcodes = capture.barcodes;
                          //   for (final barcode in barcodes) {
                          //     log('Barcode found! ${barcode.rawValue}');
                          //     setState(() {
                          //       projectController.scannedBarcode =
                          //           barcode.rawValue;
                          //     });
                          //   }
                          // },
                          onDetect: (capture) {
                            List<Barcode> barcodes = capture.barcodes;
                            for (final barcode in barcodes) {
                              log('Barcode found! ${barcode.rawValue}');
                              if (barcode.rawValue != null) {
                                setState(() {
                                  projectController.scannedBarcode =
                                      barcode.rawValue;
                                });
                                _validateAndPostProjectData(barcode.rawValue!);
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: SPACING_M),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: projectController.scannedBarcode.toString(),
                            ),
                          );
                        },
                        onDoubleTap: () {
                          setState(() {
                            launchURL(Uri.parse(
                                projectController.scannedBarcode ?? ""));
                          });
                        },
                        child: Text(
                          projectController.scannedBarcode ?? "",
                          textAlign: TextAlign.center,
                          style: FONT_16_TXT_STYLE.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: WHITE_CLR,
                          ),
                        ),
                      ),
                      const SizedBox(height: SPACING_LG),
                      SizedBox(
                        height: 60,
                        child: Obx(
                          () {
                            var items = projectController.projectIds;
                            String? dropdownValue =
                                items.contains(_selectedItem)
                                    ? _selectedItem
                                    : null;
                            return DropdownButtonFormField(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                filled: true,
                                fillColor: WHITE_CLR,
                              ),
                              hint: Text(
                                projectController.scannedBarcode ??
                                    'Select Project ID',
                                style: FONT_16_TXT_STYLE.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: TEXTFIELD_HINT_TXT_CLR,
                                ),
                              ),
                              value: dropdownValue,
                              items: items.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem = value;
                                  if (_selectedItem != null) {
                                    //  _saveSelectedItem('AAAAAA');
                                    _saveSelectedItem(_selectedItem!);
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              DEFAULT_CLR,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_selectedItem != null) {
                              var responseData = projectController.responseData;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationBarScreen()
                                    // ProjectDetailsScreen(
                                    //   selectedItem: _selectedItem!,
                                    //   id: responseData['_id'] ?? '',
                                    //   cusId: responseData['customerId'] ?? '',
                                    //   noProjects: responseData['noProjects'] ?? 0,
                                    //   status: responseData['status'] ?? '',
                                    //   companyId: responseData['companyId'] ?? '',
                                    //   createdBy: responseData['createdBy'] ?? '',
                                    //   customerSince:
                                    //       responseData['customerSince'] ?? '',
                                    //   createdDate:
                                    //       responseData['createdDate'] ?? '',
                                    //   v: responseData['__v'] ?? 0,
                                    // ),
                                    ),
                              );
                            } else if (projectController.scannedBarcode !=
                                null) {
                              _validateAndPostProjectData(
                                projectController.scannedBarcode!,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please scan a QR code or select a project ID first.'),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Get Started",
                            style: TEXT_STYLE_XSS,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Future<void> launchURL(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.platformDefault,
  )) {
    throw Exception('Could not launch $url');
  }
}

class ProjectDetailsScreen extends StatelessWidget {
  final String selectedItem;
  // final List projectId;
  final String id;
  final String cusId;
  final int noProjects;
  final String status;
  final String companyId;
  final String createdBy;
  final String customerSince;
  final String createdDate;
  final int v;

  const ProjectDetailsScreen({
    super.key,
    required this.selectedItem,
    required this.id,
    required this.cusId,
    required this.noProjects,
    required this.status,
    required this.companyId,
    required this.createdBy,
    required this.customerSince,
    required this.createdDate,
    required this.v,
    // required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Project Details',
          style: TEXT_STYLE_FONT_20_SEMI_BOLD,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selsected Project : $selectedItem',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const Divider(height: SPACING_XL),
            // Text(
            //   'Project ID : $projectId',
            //   style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            // ),
            const SizedBox(height: SPACING_SM),
            Text(
              'id :$id',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'customerId : $cusId',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'customerId : $noProjects',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'Status : $status',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'CustomerId : $companyId',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'CreatedBy : $createdBy',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'customerSince : $customerSince',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'createdDate : $createdDate',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
            Text(
              'Version : $v',
              style: FONT_16_TXT_STYLE.copyWith(color: BLACK_CLR),
            ),
            const SizedBox(height: SPACING_SM),
          ],
        ),
      ),
    );
  }
}
