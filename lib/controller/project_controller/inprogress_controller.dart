import 'dart:convert';
import 'dart:developer';

import 'package:diginova/global/constant.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/model/project_data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InProgressController extends GetxController {
  RxBool onWork = false.obs;
  RxInt currentStep = 2.obs;
  RxString title = 'Current'.obs;
  RxList<ProjectDataModel> projectDataList = <ProjectDataModel>[].obs;

  Future<void> fetchProjectData() async {
    try {
      final Map<String, String> userData = await UserDataManager.getLoginInfo();
      String jwtToken = userData['jwtToken'] ?? '';

      // String apiUrl = BASE_URL + PROJECT_CUSTOMER;
      String apiUrl = '${BASE_URL}customer/my/info';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData =
            json.decode(response.body)["projectId"];
        projectDataList.value = responseData
            .map((data) => ProjectDataModel.fromJson(data))
            .toList();
        log('responseData.toString()${responseData.toString()}');
      } else {
        log('Fetch details failed: ${response.statusCode}');
        log('Failed to fetch details: ${json.decode(response.body)}');
      }
    } catch (error) {
      log('Error fetching details: $error');
    }
  }
}
