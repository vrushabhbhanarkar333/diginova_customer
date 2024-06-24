import 'package:diginova/global/appbar.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/controller/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final LocationController controller = Get.put(LocationController());
  Offset? tapPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTapDown: (details) {
              setState(() {
                tapPosition = details.globalPosition;
                controller.showContentFrame.toggle();
              });
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  BACKGROUNDIMAGE,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/Map.png',
                  fit: BoxFit.cover,
                ),
                if (controller.showContentFrame.value && tapPosition != null)
                  Positioned(
                    left: tapPosition!.dx,
                    top: tapPosition!.dy,
                    child: Image.asset(
                      'assets/images/Content Frame.png',
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBarNova(
              onPressed: () => Navigator.pop(context),
              title: 'Location',
              fontWeight: FontWeight.w700,
              fontSize: FONT_16,
              color: BLACK_CLR,
            ),
          ),
          Positioned(
            bottom: -mediaQueryH(context) * 0.1,
            left: 10,
            right: 10,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height:
                      mediaQueryH(context) * 0.3, // Adjust the height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Number of LocationDetailsCard widgets
                    itemBuilder: (context, index) {
                      return const Column(
                        children: [
                          LocationDetailsCard(
                            image: 'assets/images/product_location.png',
                            projectNo: '515',
                            customerId: 'DE123',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationDetailsCard extends StatelessWidget {
  final String image;
  final String projectNo;
  final String customerId;
  const LocationDetailsCard({
    super.key,
    required this.image,
    required this.projectNo,
    required this.customerId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        PADDING_XS,
      ),
      child: Container(
        // width: double.infinity,
        padding: const EdgeInsets.all(
          PADDING_XXS,
        ),
        // height: mediaQueryH(context) * 0.12,
        width: mediaQueryW(context) * 0.8,
        decoration: BoxDecoration(
          color: WHITE_CLR,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Project No : ',
                          style: FONT_14_SEMI_BOLD_TXT_STYLE),
                      TextSpan(text: projectNo, style: TEXT_STYLE_SM),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Customer ID : ',
                          style: FONT_14_SEMI_BOLD_TXT_STYLE),
                      TextSpan(text: customerId, style: TEXT_STYLE_SM),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
