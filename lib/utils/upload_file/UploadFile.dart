import 'dart:typed_data'; // For Uint8List
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadFile {
  bool? isUploaded;
  String? errorMessage;

  Future<void> call(String url, XFile image) async {
    try {
      Uint8List imageBytes = await image.readAsBytes();
      var response = await http.put(Uri.parse(url), body: imageBytes);

      if (response.statusCode == 200) {
        isUploaded = true;
      } else {
        isUploaded = false;
        errorMessage = 'Failed to upload file: ${response.statusCode}';
      }
    } catch (e) {
      isUploaded = false;
      errorMessage = 'Error uploading file: $e';
    }
  }
}
