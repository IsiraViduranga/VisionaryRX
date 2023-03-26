import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PillDetection{
  static Future<Map<String, int>> uploadImage(File selectedImage) async {
    final request = http.MultipartRequest("POST", Uri.parse("https://6a6d-2402-d000-8104-d7b7-2583-3bca-aca0-858d.in.ngrok.io/upload"));
    final headers = {'Content-Type': 'multipart/form-data'};

    request.files.add(
      // Add the image file to the request as a Multipart file
      http.MultipartFile('image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path.split("/").last,
      ),
    );
    // Add the headers to the request
    request.headers.addAll(headers);
    // Send the request to the server
    final response = await request.send();
    final resString = await response.stream.bytesToString();
    // Convert the response string to JSON
    final resJson = jsonDecode(resString);

    // Create an empty map to hold the pill detection results
    Map<String, int> pillMap = {};
    resJson.forEach((key, value) {
      pillMap[key] = value;
    });
    pillMap.forEach((key, value) {
    });
    // Return the final pill detection map result
    return pillMap;
  }
}