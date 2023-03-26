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

  // Camera permissions
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

  // Select the image from gallery
  _getImage() async {
    final selectedImage =
      await ImagePicker().getImage(source: ImageSource.gallery);
    pickedImage = File(selectedImage!.path);
    setState(() {});
  }

  // Select the image from camera
  Future<void> _getImgCam() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
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
                height:250,
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
                    _getImage();
                  },
                  icon: const Icon(Icons.upload),
                  label: const Text("Upload Image"),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    _reqPerm();
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Open Camera"),
                ),
              ),
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
              const SizedBox(height: 80),
              SizedBox(
                height: 60,
                width: 260,
                child: Center(
                  child: FutureBuilder<dynamic>(
                    future: _getDetection(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text('Error loading data');
                      } else {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            height: 60,
                            width: 260,
                            child: ElevatedButton.icon(
                              onPressed: () async{
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => ResultsScreen(pills)),
                                );
                              },
                              icon: const Icon(Icons.moving, size: 30,),
                              label: const Text(
                                "View Results",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                              ),
                            ),
                          ),
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


