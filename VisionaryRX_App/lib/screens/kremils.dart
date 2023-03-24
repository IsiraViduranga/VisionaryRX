import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class KremilsScreen extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  KremilsScreen({Key? key}) : super(key: key);
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
        'Kremil-S is an antacid used to address digestive problems such as acid reflux, heartburn, and indigestion. Aluminum hydroxide and magnesium hydroxide are present, which neutralize stomach acid and alleviate symptoms. Kremil-S may also contain simethicone, a foam-reducing anti-foaming substance. '
            ' It is available as a tablet or as a suspension and is typically taken after meals or at bedtime, as instructed by a healthcare expert. Constipation, diarrhea, nausea, and vomiting are all possible adverse effects.');

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
        backgroundColor: Colors.purple[700],
        title: const Text('Medicine Information'),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Kremil-S',
              style: TextStyle(
                color: Colors.purpleAccent,
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
                    image: const AssetImage('assets/kremils.jpeg'),
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
                  color: Colors.redAccent[600],
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
                'Kremil-S is an antacid used to address digestive problems such as acid reflux, heartburn, and indigestion. Aluminum hydroxide and magnesium hydroxide are present, which neutralize stomach acid and alleviate symptoms. Kremil-S may also contain simethicone, a foam-reducing anti-foaming substance. '
                    ' It is available as a tablet or as a suspension and is typically taken after meals or at bedtime, as instructed by a healthcare expert. Constipation, diarrhea, nausea, and vomiting are all possible adverse effects.',

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