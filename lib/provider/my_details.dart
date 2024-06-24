import 'package:flutter/material.dart';

class MyDetailsProvider extends ChangeNotifier {
  Map<String, dynamic> _myData = {};

  Map<String, dynamic> get myData => _myData;

  void setMyData(Map<String, dynamic> data) {
    _myData = data;
    notifyListeners();
  }
}
