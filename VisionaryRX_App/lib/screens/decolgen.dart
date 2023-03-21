import 'package:flutter/material.dart';

class DecolgenScreen extends StatelessWidget {
  const DecolgenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: const Text('Medicine Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Decolgen',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 36,
                fontWeight: FontWeight.w700,
                fontFamily: 'Alata',
                letterSpacing: 7,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(""),
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.9),
                      BlendMode.dstATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                //play button functionality
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blueAccent[600],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Decolgen is a brand name for a medication that is commonly used for the relief of symptoms associated with colds, flu, and allergies.Common side effects of Decolgen include dizziness, drowsiness, dry mouth, upset stomach, and difficulty urinating. It is essential to consult a doctor or pharmacist before taking Decolgen, especially if you have any underlying medical conditions or are taking any other medications.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Alata',
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}