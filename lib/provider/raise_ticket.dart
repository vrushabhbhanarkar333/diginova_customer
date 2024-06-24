import 'package:flutter/material.dart';

class TicketProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _tickets = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get tickets => _tickets;
  bool get isLoading => _isLoading;

  void setTickets(List<Map<String, dynamic>> tickets) {
    _tickets = tickets;
    notifyListeners();
  }

  void addTicket(Map<String, dynamic> newTicket) {
    _tickets.insert(0, newTicket); // Insert at the beginning of the list
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
