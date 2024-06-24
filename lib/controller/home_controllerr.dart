import 'package:diginova/global/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Color> selectedColor = DEFAULT_CLR.obs;

  void setSelectedColor(Color color) {
    selectedColor.value = color;
  }
}
