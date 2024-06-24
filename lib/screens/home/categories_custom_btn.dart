import 'package:diginova/controller/home_controllerr.dart';
import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesBtn extends StatelessWidget {
  final String text;
  final String image;
  // final double height;
  // final double width;
  final Color backgroundClr;
  final VoidCallback onPressed;

  const CategoriesBtn({
    super.key,
    required this.text,
    required this.image,
    required this.backgroundClr,
    required this.onPressed,
    // required this.height,
    // required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return GestureDetector(
      onTap: () {
        if (homeController.selectedColor.value == backgroundClr) {
          // If already selected, set color to DEFAULT_CLR
          homeController.setSelectedColor(DEFAULT_CLR);
        } else {
          // If not selected, set color to CATEGORIES_BG_CLR
          homeController.setSelectedColor(backgroundClr);
        }
        onPressed();
      },
      child: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.28,
          padding: const EdgeInsets.symmetric(
              horizontal: PADDING_XXS, vertical: PADDING_XS),
          decoration: BoxDecoration(
            color: homeController.selectedColor.value == backgroundClr
                ? DEFAULT_CLR
                : CATEGORIES_BG_CLR,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromARGB(10, 0, 0, 0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: FONT_XSS,
                  fontWeight: FontWeight.w400,
                  color: homeController.selectedColor.value == backgroundClr
                      ? CATEGORIES_BG_CLR
                      : DEFAULT_CLR,
                ),
              ),
              Image.asset(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                image,
                color: homeController.selectedColor.value == backgroundClr
                    ? CATEGORIES_BG_CLR
                    : DEFAULT_CLR,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
///CATEGORIES PAGE BUTTON
///
///
///
class CategoriesPageBtn extends StatelessWidget {
  final String text;
  final String image;
  // final double height;
  // final double width;
  final Color backgroundClr;
  final VoidCallback onPressed;

  const CategoriesPageBtn({
    super.key,
    required this.text,
    required this.image,
    required this.backgroundClr,
    required this.onPressed,
    // required this.height,
    // required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return GestureDetector(
      onTap: () {
        if (homeController.selectedColor.value == backgroundClr) {
          // If already selected, set color to DEFAULT_CLR
          homeController.setSelectedColor(DEFAULT_CLR);
        } else {
          // If not selected, set color to CATEGORIES_BG_CLR
          homeController.setSelectedColor(backgroundClr);
        }
        onPressed();
      },
      child: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width * 0.28,
          height: MediaQuery.of(context).size.height * 0.17,

          padding: const EdgeInsets.all(PADDING_XXS),
          // width: width,
          decoration: BoxDecoration(
            color: homeController.selectedColor.value == backgroundClr
                ? DEFAULT_CLR
                : CATEGORIES_BG_CLR,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color.fromARGB(10, 0, 0, 0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: FONT_XSS,
                  fontWeight: FontWeight.w400,
                  color: homeController.selectedColor.value == backgroundClr
                      ? CATEGORIES_BG_CLR
                      : DEFAULT_CLR,
                ),
              ),
              Image.asset(
                height: 50,
                width: 50,
                image,
                color: homeController.selectedColor.value == backgroundClr
                    ? CATEGORIES_BG_CLR
                    : DEFAULT_CLR,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
