import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  var currentStep = 4.obs;

  void updateCurrentStep(int step) {
    currentStep.value = step;
  }
}
