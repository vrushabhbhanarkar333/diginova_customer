import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialMediaController extends GetxController {
  final TextEditingController instaController = TextEditingController();
  final TextEditingController fbController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController ytController = TextEditingController();

  @override
  void onClose() {
    instaController.dispose();
    fbController.dispose();
    twitterController.dispose();
    ytController.dispose();
    super.onClose();
  }
}
