import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BiogesicScreen extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();
  BiogesicScreen({Key? key}) : super(key: key);
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
        'Biogesic is a pain reliever medication that contains acetaminophen as its active ingredient. Biogesic is typically taken orally in tablet form, and the recommended dosage may vary depending on the individual.While Biogesic is generally considered safe when used as directed, it may not be suitable for everyone. '
            ' People with liver disease or a history of alcohol abuse should consult with a healthcare professional before taking Biogesic, as it can cause liver damage in high doses or when combined with alcohol.');

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
        backgroundColor: Colors.yellow[700],
        title: const Text('Medicine Information'),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Biogesic',
              style: TextStyle(
                color: Colors.yellow,
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
                    image: const AssetImage('assets/Biogesic.png'),
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
                  color: Colors.yellow,
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
                'Biogesic is a pain reliever medication that contains acetaminophen as its active ingredient. Biogesic is typically taken orally in tablet form, and the recommended dosage may vary depending on the individual. While Biogesic is generally considered safe when used as directed, it may not be suitable for everyone. '
                    ' People with liver disease or a history of alcohol abuse should consult with a healthcare professional before taking Biogesic, as it can cause liver damage in high doses or when combined with alcohol. ',
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