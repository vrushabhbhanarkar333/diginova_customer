import 'package:flutter/material.dart';

class ServiceBookingProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _bookings = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get bookings => _bookings;
  bool get isLoading => _isLoading;

  void setbookings(List<Map<String, dynamic>> bookings) {
    _bookings = bookings;
    notifyListeners();
  }

  void addBooking(Map<String, dynamic> newBooking) {
    _bookings.insert(0, newBooking); // Insert at the beginning of the list
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
