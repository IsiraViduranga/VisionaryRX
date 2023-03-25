import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:visionaryrx/screens/login.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key});

  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  User? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    final User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      currentUser = user;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 196, 233, 229),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome, ${currentUser?.email ?? ''}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 11, 11, 11),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'At VisionaryRX, we are committed to protecting the privacy of our users. We collect personal information from users, such as name and email address, when they create an account and use the camera to scan their medication. This information is used to provide our services, including identifying medication using YOLO object detection technology and providing medication information. We may disclose personal information to third-party service providers to help us provide our services and comply with legal obligations. We take reasonable measures to protect the personal information we collect from unauthorized access, disclosure, or destruction. Our app is not intended for children under the age of 13. We may update this privacy policy from time to time, and users are encouraged to review it periodically. By using the VisionaryRX app, users consent to the terms of this privacy policy.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _signOut,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Sign out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
