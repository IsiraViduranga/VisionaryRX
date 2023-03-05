import 'package:flutter/material.dart';
import '../screens/login.dart';

void main() {
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


