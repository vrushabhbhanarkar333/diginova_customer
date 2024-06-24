import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KnowledgeBaseController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString searchQuery = ''.obs;

  void setSearchQuery(String value) {
    searchQuery.value = value;
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
