import 'dart:convert';
import 'dart:developer';

import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/model/ongoing_project_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProjectDetailsController extends GetxController {
  RxBool isProgressive = false.obs;
  RxBool isFinished = false.obs;
  RxString appBarTitle = 'Projects'.obs;
  Rxn<OngoingProjectDataModel> projectDataList = Rxn<OngoingProjectDataModel>();

  void setIsProgressive(bool value) {
    isProgressive.value = value;
  }

  void setIsFinished(bool value) {
    isFinished.value = value;
  }

  void setAppBarTitle(String title) {
    appBarTitle.value = title;
  }

  Future<void> fetchProjectDetails() async {
    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? "";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? projectId = prefs.getString('selectedItem');

      if (projectId == null) {
        log('Project ID is null. Cannot fetch project details.');
        return;
      }

      String apiUrl = '${BASE_URL}project/id/$projectId';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
        },
      );
      log('Response for project details: ${response.body}',
          name: 'ONGOING PROJECT DETAILS');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        OngoingProjectDataModel projectData =
            OngoingProjectDataModel.fromJson(responseData);
        // log('Status code: ${json.decode(response.body)}');

        // Update the project data
        projectDataList.value = projectData;
      } else {
        log('Failed to fetch project details. Status code: ${response.statusCode}');
        log('Failed to fetch details: ${json.decode(response.body)}');
        // Handle the navigation to QR code screen or any other appropriate action
      }
    } catch (e) {
      log('Error fetching details: $e');
    }
  }
}
