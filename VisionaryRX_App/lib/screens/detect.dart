import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PillDetection{
  static Future<Map<String, int>> uploadImage(File selectedImage) async {
    final request = http.MultipartRequest("POST", Uri.parse("https://4f3b-2402-d000-8104-d7b7-44af-7cc6-bfc7-8314.in.ngrok.io/upload"));
    final headers = {'Content-Type': 'multipart/form-data'};

    request.files.add(
      http.MultipartFile('image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split("/").last,
      ),
    );
    request.headers.addAll(headers);
    final response = await request.send();
    final resString = await response.stream.bytesToString();
    final resJson = jsonDecode(resString);

    Map<String, int> pillMap = {};
    resJson.forEach((key, value) {
      pillMap[key] = value;
    });
    pillMap.forEach((key, value) {
    });
    return pillMap;
  }
}