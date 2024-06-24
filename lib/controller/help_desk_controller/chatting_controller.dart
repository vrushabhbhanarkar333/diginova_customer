import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxList<String> messages = <String>[].obs;

  RxString enteredText = ''.obs;

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(message);
      textEditingController.clear();
    }
  }
}
