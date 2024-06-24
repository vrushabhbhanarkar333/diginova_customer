import 'package:diginova/controller/project_controller/recent_update_controller.dart';
import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/screens/project/update.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentUpdate extends StatelessWidget {
  const RecentUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final RecentUpdateController _recentUpdateController =
        Get.put(RecentUpdateController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          AppBarNova(
            onPressed: () => Navigator.pop(context),
            title: 'Recent Updates',
            fontSize: FONT_16,
            fontWeight: FontWeight.w500,
            color: PURPLE_SHADE_CLR,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 18,
              right: 18,
            ),
            child: RecentUpdateList(
              updateList: _recentUpdateController.updateList,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentUpdateList extends StatelessWidget {
  final RxList<Map<String, dynamic>> updateList;

  const RecentUpdateList({
    super.key,
    required this.updateList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: SPACING_SM,
      ),
      itemCount: updateList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Update(),
              ),
            );
          },
          child: Card(
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: PADDING_MD,
                horizontal: PADDING_MD,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: DEFAULT_CLR,
                        ),
                        height: 39.42,
                        width: 39.42,
                        child: Image.asset(
                          'assets/images/to-do-list 1 (Traced).png',
                          color: WHITE_CLR,
                        ),
                      ),
                      const SizedBox(width: SPACING_MD),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            updateList[index]['title'],
                            style: GoogleFonts.poppins(
                              fontSize: FONT_14,
                              fontWeight: FontWeight.w600,
                              color: BLACK_CLR_SHADE,
                            ),
                          ),
                          Text(
                            updateList[index]['days'],
                            style: GoogleFonts.poppins(
                              fontSize: FONT_XS,
                              fontWeight: FontWeight.w400,
                              color: BLUR_GREY_SHADE_CLRS,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Color(0XFFD8DEF3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
