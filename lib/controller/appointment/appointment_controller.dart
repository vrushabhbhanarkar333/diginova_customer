import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final RxBool upComing = true.obs;
  final RxBool history = false.obs;

  void toggleUpcoming() {
    upComing.value = true;
    history.value = false;
  }

  void toggleHistory() {
    upComing.value = false;
    history.value = true;
  }
}
