import 'dart:convert';
import 'dart:developer';

import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProjectController extends GetxController {
  Map<String, dynamic> responseData = {};
  var projectIds = <String>[].obs; // Observable list to store project IDs
  String? scannedBarcode;
  // UpdateDataModel? _updatedqrData;

  Future<void> fetchCustomerData() async {
    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';
      String apiUrl = BASE_URL + CUSTOMER_INFO;

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        responseData = json.decode(response.body);

        update();
        // log(responseData.toString(), name: "Project Data");

        List<dynamic> projectList = responseData['projectId'];
        projectIds.clear(); // Clear existing project IDs
        for (var project in projectList) {
          projectIds.add(project['projectID'].toString());
          // log(project['projectID'].toString(), name: "Project ID");
        }
      } else {
        log('Fetch details failed: ${response.statusCode}');
        log('Failed to fetch details: ${json.decode(response.body)}');
      }
    } catch (error) {
      log('Error fetching details: $error');
    }
  }

  Future<UpdateDataModel?> updateQrData(String qrCodeData) async {
    final Map<String, String> userData = await UserDataManager.getLoginInfo();
    String jwtToken = userData['jwtToken'] ?? '';
    String uid = userData['uid'] ?? '';
    String apiUrl = '${BASE_URL}customer/project/$uid';

    Map<String, dynamic> request = {
      "project": qrCodeData,
    };

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request),
      );

      if (response.statusCode == 200) {
        UpdateDataModel model = UpdateDataModel.fromJson(
          jsonDecode(response.body),
        );
        log(response.body, name: 'Project data posted successfully');
        return model;
      } else {
        log('Failed to post project data. Status code: ${response.statusCode}');
        log('Response body: ${response.body}');
      }
    } catch (e) {
      log('Error occurred while posting project data: $e');
    }
    return null;
  }
}

class UpdateDataModel {
  UpdateDataModel({
    this.project,
  });
  String? project;

  UpdateDataModel.fromJson(Map<String, dynamic> json) {
    project = json['project'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project'] = project;
    return data;
  }
}
