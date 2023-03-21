import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:visionaryrx/screens/bioflu.dart';
import 'package:visionaryrx/screens/drugpillinformation.dart';
import 'package:visionaryrx/screens/forgotpassword.dart';
import 'package:visionaryrx/screens/scan_page.dart';
import '../screens/biogesic.dart';
import '../screens/login.dart';
import '../screens/signup.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const VisionaryRX());
}

class VisionaryRX extends StatelessWidget {
  const VisionaryRX({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'VisionaryRX',
      home: BiogesicScreen(),
    );
  }
}


