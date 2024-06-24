import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diginova/global/constant.dart';

class GenerateImageUrl {
  bool? success;
  String? message;

  bool? isGenerated;
  String? uploadUrl;
  String? downloadUrl;

  Future<void> call(String fileType) async {
    try {
      Map body = {"fileType": fileType};
      print(body.toString());

      final http.Response response = await http.post(
        // Uri.parse('${BASE_URL}flutter/generatePresignedUrl'),
        Uri.parse('${BASE_URL}media/getUploadUrl'),

        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"fileType": fileType}),
      );

      var result = jsonDecode(response.body);

      print(result);

      if (result['success'] != null) {
        success = result['success'];
        message = result['message'];

        if (response.statusCode == 201) {
          isGenerated = true;
          uploadUrl = result["uploadUrl"];
          downloadUrl = result["downloadUrl"];
        }
      }
    } catch (e) {
      throw ('Error getting url');
    }
  }
}
