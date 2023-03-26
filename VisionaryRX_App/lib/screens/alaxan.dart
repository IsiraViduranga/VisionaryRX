import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlaxanScreen extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();
  AlaxanScreen({Key? key}) : super(key: key);
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
        "Alaxan is a brand name of a pain reliever medication that contains the active ingredients Ibuprofen and Paracetamol.It is commonly used to alleviate mild to moderate pain, such as headaches, toothaches, menstrual cramps, and muscle aches.  Alaxan is available in tablet form and should be taken with food to reduce the risk of stomach upset. It is important to follow the recommended dosage and to avoid taking more than the prescribed amount, as it can cause harmful side effects.");

    // Set isPlaying to true
    isPlaying = true;

    // Set a completion handler to update the isPlaying flag when finished speaking
    flutterTts.setCompletionHandler(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: const Text('Medicine Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Alaxan',
              style: TextStyle(
                color: Colors.redAccent,
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
                    image: const AssetImage('assets/Alaxan.png'),
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
                  color: Colors.red,
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
                'Alaxan is a brand name of a pain reliever medication that contains the active ingredients Ibuprofen and Paracetamol.It is commonly used to alleviate mild to moderate pain, such as headaches, toothaches, menstrual cramps, and muscle aches.  Alaxan is available in tablet form and should be taken with food to reduce the risk of stomach upset. It is important to follow the recommended dosage and to avoid taking more than the prescribed amount, as it can cause harmful side effects.',
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