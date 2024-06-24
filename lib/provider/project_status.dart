import 'package:flutter/material.dart';

class ProjectDetailsProvider extends ChangeNotifier {
  List<dynamic> _projectData = [];
  bool _isLoading = false;

  List<dynamic> get projectData => _projectData;
  bool get isLoading => _isLoading;

  void setprojectData(List<dynamic> data) {
    _projectData = data;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
