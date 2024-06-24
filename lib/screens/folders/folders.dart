import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/files/my_folder_cus_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/project_status.dart';
import 'project_folder.dart';

class Folderspage extends StatefulWidget {
  // final String projectId;

  const Folderspage({
    Key? key,
  }) : super(key: key);

  @override
  _FolderspageState createState() => _FolderspageState();
}

class _FolderspageState extends State<Folderspage> {
  @override
  void initState() {
    super.initState();
    // Perform any initialization with widget.projectId
    // For example, you could fetch data related to the projectId
    // Provider.of<ProjectDetailsProvider>(context, listen: false)
    //     .fetchProjectData(widget.projectId);
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
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
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
                        weight: 20,
                      ),
                    ),
                    title: Text(
                      'Folders',
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

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.projectData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final data = provider.projectData[index];
                          return MyFoldersBtn(
                            title: data['projectName'] ?? 'Unknown',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectFoldersPage(
                                    projectId: data['projectID'],
                                    projectName: data['projectName'],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
