import 'package:diginova/screens/files/file.dart';
import 'package:diginova/screens/help_desk/help.dart';
import 'package:diginova/screens/project/project.dart';
import 'package:flutter/material.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/home/categories_custom_btn.dart';
import 'package:diginova/screens/knowladgeBase/knowledge.dart';
import 'package:diginova/screens/location/location.dart';
import 'package:diginova/screens/project/monitor.dart';
import 'package:diginova/screens/project/process_two.dart';
import 'package:diginova/screens/update_screen/update_1.dart';
import 'package:diginova/screens/warrenty/warrenty_screen.dart';

import '../../utils/bottom_nav_pages.dart/chatbot_new.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Color _selectedColor;

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
              'Categories',
              style: TEXT_STYLE_M
                ..copyWith(
                  color: BLACK_CLR,
                ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.15,
              left: PADDING_SM,
              right: PADDING_SM,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Project',
                      image: PROJECTIMAGE,
                      backgroundClr: Colors.blue, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProjectScreen(),
                          ),
                        );
                      },
                    ),
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Files',
                      image: FILESIMAGE,
                      backgroundClr: Colors.orange, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilePage(
                                // saveProjectFile: '',
                                ),
                          ),
                        );
                      },
                    ),
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Performance',
                      image: PERFORMANCEIMAGE,
                      backgroundClr: Colors.orangeAccent, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilePage(
                                // saveProjectFile: '',
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: SPACING_M),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Update',
                      image: UPDATEIMAGE,
                      backgroundClr: Colors.red, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UpdateScreen_1(),
                          ),
                        );
                      },
                    ),
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Moniter',
                      image: MONITERIMAGE,
                      backgroundClr: Colors.purple, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Monitor(),
                          ),
                        );
                      },
                    ),
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Message',
                      image: RAISE_TICKETIMAGE,
                      backgroundClr: Colors.teal, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatBot()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: SPACING_M),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Warrenty',
                      image: WARRENTYIMAGE,
                      backgroundClr: Colors.grey, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WarrentyScreen(),
                          ),
                        );
                      },
                    ),
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Location',
                      image: LOCATIONIMAGE,
                      backgroundClr: Colors.brown, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Location(),
                          ),
                        );
                      },
                    ),
                    CategoriesPageBtn(
                      // height: 128,
                      // width: 107,
                      text: 'Knowledge \n Base',
                      image: KNOWLEDGEBASEIMAGE,
                      backgroundClr: Colors.indigo, // Change color here
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KnowledgeBase(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
