// ignore_for_file: file_names

// import 'dart:convert';
import 'dart:io'; // For File
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:diginova/global/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class GenerateImageUrl {
  bool? success;
  String? message;

  bool? isGenerated;
  String? uploadUrl;
  String? downloadUrl;

  Future<bool> call(String fileName, String profileImgType, XFile file) async {
    try {
      // log('${BASE_URL}media/getUploadUrl?fileName=$fileName&contentType=$profileImgType');
      final http.Response response = await http.get(
        Uri.parse(
            '${BASE_URL}media/getUploadUrl?fileName=$fileName&contentType=$profileImgType'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check if the request was successful and response status code is OK
      if (response.statusCode == 200) {
        var presignedUrl = jsonDecode(response.body);
        log(presignedUrl['url']);
        final byteFile = await file.readAsBytes();
        final uploadResponse = await http.put(
          Uri.parse(presignedUrl['url']),
          body: byteFile,
          headers: {'Content-Type': profileImgType},
        );
        log(profileImgType);
        // Check if upload was successful
        if (uploadResponse.statusCode == 200) {
          return true;
        } else {
          // Handle upload failure
          log('File upload failed: ${uploadResponse.body}');
          return false;
        }
      } else {
        // Handle failure to get presigned URL
        log('Failed to get upload URL: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle other errors
      log('File upload error: $error');
      return false;
    }
  }

  Future<bool> callForMultiFile(
      String fileName, String profileImgType, PlatformFile file) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
            '${BASE_URL}media/getUploadUrl?fileName=$fileName&contentType=$profileImgType'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check if the request was successful and response status code is OK
      if (response.statusCode == 200) {
        var presignedUrl = jsonDecode(response.body);
        log('Presigned URL: ${presignedUrl['url']}');

        Uint8List byteFile;

        // If bytes are null, read from the file path
        if (file.bytes != null) {
          byteFile = file.bytes!;
        } else if (file.path != null) {
          byteFile = await File(file.path!).readAsBytes();
        } else {
          log('File bytes and path are both null.');
          return false;
        }

        final uploadResponse = await http.put(
          Uri.parse(presignedUrl['url']),
          body: byteFile,
          headers: {'Content-Type': profileImgType},
        );

        log('Upload response status: ${uploadResponse.statusCode}');
        log('Upload response body: ${uploadResponse.body}');

        // Check if upload was successful
        if (uploadResponse.statusCode == 200) {
          return true;
        } else {
          // Handle upload failure
          log('File upload failed: ${uploadResponse.body}');
          return false;
        }
      } else {
        // Handle failure to get presigned URL
        log('Failed to get upload URL: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      // Handle other errors
      log('File upload error: $error');
      return false;
    }
  }
}
