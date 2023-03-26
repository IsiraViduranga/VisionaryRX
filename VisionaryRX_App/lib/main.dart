import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:visionaryrx/screens/root_page.dart';
import 'screens/login.dart';

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
      home: Login(),
    );
  }
}
