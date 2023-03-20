import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  File? selectedImage;
  String? message = '';

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://700b-2402-d000-8104-d7b7-5cd5-8e23-234c-f0b8.in.ngrok.io/upload"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
        filename: selectedImage !.path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    print('Response status code: ${response.statusCode}');
    message = resJson['message'];
    print('Response body: ${res.body}');
    setState(() {});
  }

  Future getImage() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null
                ? const Text("Pick an image to upload")
                : Image.file(selectedImage!),
            TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: uploadImage,
                icon: const Icon(Icons.upload_file, color: Colors.white),
                label: const Text(
                  "Upload",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

