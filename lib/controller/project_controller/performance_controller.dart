import 'package:diginova/screens/project/monitor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformanceController extends GetxController {
  RxBool isDay = false.obs;
  RxBool isWeek = false.obs;
  RxBool isMonth = false.obs;
  RxBool isYear = false.obs;
  RxDouble percentageValue = 70.0.obs;

  void selectDay() {
    isDay.value = true;
    isWeek.value = false;
    isMonth.value = false;
    isYear.value = false;
  }

  void selectWeek(BuildContext context) {
    isDay.value = false;
    isWeek.value = true;
    isMonth.value = false;
    isYear.value = false;
    Get.to(() => const Monitor());
  }

  void selectMonth() {
    isDay.value = false;
    isWeek.value = false;
    isMonth.value = true;
    isYear.value = false;
  }

  void selectYear() {
    isDay.value = false;
    isWeek.value = false;
    isMonth.value = false;
    isYear.value = true;
  }
}
