import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RaiseController extends GetxController {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController forController = TextEditingController();

  void raiseTicket() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: const Color(0XFFFFFFFF),
      barrierDismissible: false,
      title: "",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: BLACK_SHADE,
                  size: 15,
                ),
              ),
            ),
          ),
          Lottie.network(
            'https://lottie.host/88dfbcc5-b21a-40c0-ae5c-fd60e3e763b0/hnK6fQzQ0O.json',
            // fit: BoxFit.cover,
            height: 150,
            width: 400,
          ),
          Text(
            "Successfully Raised Ticket",
            style: GoogleFonts.poppins(
              fontSize: FONT_SM,
              fontWeight: FontWeight.w700,
              color: DEFAULT_CLR,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: 123,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
                subjectController.clear();
                descriptionController.clear();
                priorityController.clear();
                forController.clear();
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(BTN_BLUE_CLR),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(9.77),
                    ),
                  ),
                ),
              ),
              child: Text(
                "Done",
                style: GoogleFonts.poppins(
                  fontSize: FONT_XSS,
                  fontWeight: FontWeight.w600,
                  color: WHITE_CLR,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
