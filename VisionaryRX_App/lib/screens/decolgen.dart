import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DecolgenScreen extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts(); // initializing here
  DecolgenScreen({Key? key}) : super(key: key);
  bool isPlaying = false;

  _speak() async {
    if (isPlaying) {
      await flutterTts.stop();
      isPlaying = false;
      return;
    }

    // Set the speech rate, pitch, and language
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.2);
    await flutterTts.setLanguage("en-US");

    // Speak the text
    await flutterTts.speak(
        "Decolgen is a brand name for a medication that is commonly used for the relief of symptoms associated with cold, flu, and allergies. Common side effects of Decolgen include dizziness, drowsiness, dry mouth, upset stomach, and difficulty urinating. It is essential to consult a doctor or pharmacist before taking Decolgen, especially if you have any underlying medical conditions or are taking any other medications.");

    // Set isPlaying to true
    isPlaying = true;

    // Set a completion handler to update the isPlaying flag when finished speaking
    flutterTts.setCompletionHandler(() {
      isPlaying = false;
    });
  }

  void _onPressed() {
    if (isPlaying) {
      _stop();
    } else {
      _speak();
    }
  }

  void _stop() async {
    await flutterTts.stop();
    isPlaying = false;
  }


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
                    image: const AssetImage('decolgen.jpeg'),
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
                _speak();
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(1.0),
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
                'Decolgen is a brand name for a medication that is commonly used for the relief of symptoms associated with cold, flu, and allergies.Common side effects of Decolgen include dizziness, drowsiness, dry mouth, upset stomach, and difficulty urinating. It is essential to consult a doctor or pharmacist before taking Decolgen, especially if you have any underlying medical conditions or are taking any other medications.',
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