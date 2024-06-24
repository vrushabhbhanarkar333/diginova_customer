import 'package:get/get.dart';

class FileController extends GetxController {
  RxDouble indicatorPercentage = 9.6.obs;
  double totalIndicatorPercentage = 20.0;

  double get percent => indicatorPercentage.value / totalIndicatorPercentage;

  void updateIndicator(double newPwecentage) {
    indicatorPercentage.value = newPwecentage;
  }
}
