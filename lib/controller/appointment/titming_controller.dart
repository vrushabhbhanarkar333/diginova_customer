import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimingController extends GetxController {
  final TextEditingController problemController = TextEditingController();

  final RxBool isTime = false.obs;
  final RxString selectedTime = ''.obs;
  DateTime now = DateTime.now();

  void selecteTime(String time) {
    isTime.value = true;
    selectedTime.value = time;
  }
}
