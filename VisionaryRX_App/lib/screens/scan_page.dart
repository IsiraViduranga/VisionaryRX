import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:visionaryrx/ResultsScreen.dart';
import '../screens/detect.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  File? pickedImage;
  late Map<String,int> pills;

  _getDetection() async{
    pills = await PillDetection.uploadImage(pickedImage!);
  }

  _reqPerm() async{
    PermissionStatus cameraStatus = await Permission.camera.request();
    if(cameraStatus == PermissionStatus.granted){
      _getImgCam();
    }
    if(cameraStatus == PermissionStatus.permanentlyDenied){
      openAppSettings();
    }
  }

  _setPicture(XFile photo) {
    setState(() {
      pickedImage = File(photo.path);
    });
  }

  _getImage() async {
    final selectedImage =
      await ImagePicker().getImage(source: ImageSource.gallery);
    pickedImage = File(selectedImage!.path);
    setState(() {});
  }

  Future<void> _getImgCam() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if(photo != null){
      _setPicture(photo);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detect Pills",
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          pickedImage == null?
          Column(
            children: [
              Container(
                height: 300,
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 100,
                    child: Container(),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async{
                    _reqPerm();
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text("Upload Image"),
                ),
              )
            ],
          ) :
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0), // set the top padding
                child: Center(
                  child: SizedBox(
                      width: (MediaQuery.of(context).size.width) * 5 / 6,
                      height: MediaQuery.of(context).size.width * 5 / 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0), // set the border radius
                        child: Image.file(
                          pickedImage!,
                          fit: BoxFit.fill,
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: FutureBuilder<dynamic>(
                    future: _getDetection(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text('Error loading data');
                      } else {
                        return ElevatedButton.icon(
                          onPressed: () async{
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => ResultsScreen(pills)),
                            );
                          },
                          icon: const Icon(Icons.moving),
                          label: const Text("Go"),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


