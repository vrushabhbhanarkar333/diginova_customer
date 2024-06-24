import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../controller/file_controller.dart';
import '../../global/utility.dart';
import '../../provider/project_status.dart';
import '../folders/folders.dart';
import '../folders/project_folder.dart';
import 'all_pdf_files.dart';
import 'my_folder_cus_btn.dart';
import 'pdf_btn.dart';

class FilePage extends StatefulWidget {
  @override
  _FilePageState createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final FileController _fileController = Get.put(FileController());

  @override
  void initState() {
    _fetchprojects();
    super.initState();
  }

  Future<void> _fetchprojects() async {
    setState(() {});

    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';
      String uid = userData['uid'] ?? '';
      log(uid);

      final String apiUrl = '${BASE_URL}customer/my/info';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        log(response.body);
        final List<dynamic> data = json.decode(response.body)['projectId'];

        // Explicitly cast List<dynamic> to List<Map<String, dynamic>>
        List<Map<String, dynamic>> projectData =
            List<Map<String, dynamic>>.from(data);

        // Use Provider to update the project data
        // ignore: use_build_context_synchronously
        Provider.of<ProjectDetailsProvider>(context, listen: false)
            .setprojectData(projectData);
      } else {
        log('Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (error) {
      log('Error fetching notifications: $error');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FileController>(builder: (_) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              BACKGROUNDIMAGE,
              fit: BoxFit.cover,
            ),
            AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  weight: 20,
                ),
              ),
              title: Text(
                'Files',
                style: TEXT_STYLE_M,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: DEFAULT_CLR,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: SPACING_LG),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: SPACING_MD),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Folders',
                            style: FONT_16_TXT_STYLE,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Folderspage(),
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: FONT_14_TXT_STYLE,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SPACING_M),
                    Padding(
                      padding: const EdgeInsets.only(left: SPACING_MD),
                      child: Consumer<ProjectDetailsProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (provider.projectData.isEmpty) {
                            return const Center(child: Text('No data found.'));
                          }

                          return SizedBox(
                            height: 200,
                            // Adjust height as needed
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.projectData.length,
                              itemBuilder: (context, index) {
                                final data = provider.projectData[index];
                                return MyFoldersBtn(
                                  title: data['projectID'] ?? 'Unknown',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProjectFoldersPage(
                                          projectId: data['projectID'],
                                          projectName: data['projectName'],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: SPACING_M),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: SPACING_MD),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Files',
                            style: FONT_16_TXT_STYLE,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AppPdfFiles(),
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: FONT_14_TXT_STYLE,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SPACING_LG),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: SPACING_MD),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PdfBtn(
                              title: 'Diginova',
                              value: '1.3MB',
                            ),
                            PdfBtn(
                              title: 'Nova',
                              value: '1.3MB',
                            ),
                            PdfBtn(
                              title: 'Diginova',
                              value: '1.3MB',
                            ),
                            PdfBtn(
                              title: 'Nova',
                              value: '1.3MB',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
