import 'package:get/get.dart';

class HelpDeskController extends GetxController {
  var isChatSelected = false.obs;
  var isTicketSelected = false.obs;
  var appBarTitle = 'Help Desk'.obs;

  void selectChat() {
    isChatSelected.value = true;
    isTicketSelected.value = false;
    appBarTitle.value = 'Help Desk';
  }

  void selectRaiseTicket() {
    isChatSelected.value = false;
    isTicketSelected.value = true;
    appBarTitle.value = 'Raise Ticket';
  }
}
