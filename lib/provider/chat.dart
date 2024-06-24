import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  List<dynamic> _chatMessages = [];

  List<dynamic> get chatMessages => _chatMessages;

  void addMessage(dynamic message) {
    _chatMessages.add(message);
    notifyListeners();
  }

  void initChatMessages(List<dynamic> messages) {
    _chatMessages = messages;
    notifyListeners();
  }
}
