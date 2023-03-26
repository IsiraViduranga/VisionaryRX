import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class DayZincScreen extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();
  DayZincScreen({Key? key}) : super(key: key);
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
        'DayZinc is a brand name for a dietary supplement that contains zinc as its main active ingredient.DayZinc is commonly used to support immune function and prevent or treat zinc deficiency, which can occur due to poor diet, certain medical conditions, or medications that interfere with zinc absorption.'
            ' While DayZinc is generally considered safe when used as directed, it may not be suitable for everyone. People with certain medical conditions, such as kidney disease, may need to avoid taking high doses of zinc supplements, as it can cause toxicity.');

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
        backgroundColor: Colors.lightGreen[700],
        title: const Text('Medicine Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'DayZinc',
              style: TextStyle(
                color: Colors.green,
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
                    image: const AssetImage('assets/Dayzinc.png'),
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
                  color: Colors.green,
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
                'DayZinc is a brand name for a dietary supplement that contains zinc as its main active ingredient.DayZinc is commonly used to support immune function and prevent or treat zinc deficiency, which can occur due to poor diet, certain medical conditions, or medications that interfere with zinc absorption.'
                    ' While DayZinc is generally considered safe when used as directed, it may not be suitable for everyone. People with certain medical conditions, such as kidney disease, may need to avoid taking high doses of zinc supplements, as it can cause toxicity.',
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