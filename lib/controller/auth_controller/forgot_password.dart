import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final RxString password = ''.obs;

  void setPassword(String value) => password.value = value;
}
