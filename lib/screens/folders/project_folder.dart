import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/files/my_folder_cus_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/project_status.dart';

class ProjectFoldersPage extends StatefulWidget {
  final String projectId;
  final String projectName;

  ProjectFoldersPage(
      {super.key, required this.projectId, required this.projectName});

  @override
  _ProjectFoldersPageState createState() => _ProjectFoldersPageState();
}

class _ProjectFoldersPageState extends State<ProjectFoldersPage> {
  List<dynamic> _showFiles = [];

  _launchURL(String stringUrl) async {
    final Uri url = Uri.parse(stringUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw Exception('Could not launch $stringUrl');
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
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                      ),
                    ),
                    title: Text(
                      widget.projectName,
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
                  Consumer<ProjectDetailsProvider>(
                    builder: (context, provider, child) {
                      if (provider.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (provider.projectData.isEmpty) {
                        return const Center(
                          child: Text('No data found.'),
                        );
                      }

                      final project = provider.projectData.firstWhere(
                        (project) => project['projectID'] == widget.projectId,
                        orElse: () => <String,
                            dynamic>{}, // Return an empty map if not found
                      );

                      final steps = project['steps'] ?? [];

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: steps.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, stepIndex) {
                          final step = steps[stepIndex];
                          return MyFoldersBtn(
                            title: step['title'] ?? 'Unknown',
                            onTap: () {
                              setState(() {
                                _showFiles = step['media'] ?? [];
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                  _showFiles.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            const Text("Files: "),
                            const SizedBox(height: 8),
                            GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _showFiles.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, fileIndex) {
                                final file = _showFiles[fileIndex];
                                return MyFoldersBtn(
                                  title: file.split('/').last ?? 'Unknown',
                                  folder: 'file',
                                  onTap: () {
                                    String url = '${IMAGE_BASE_URL}$file';
                                    _launchURL(url);
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
