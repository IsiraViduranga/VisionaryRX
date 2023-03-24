import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

Color myColor = const Color(0xFFe6f7eb);

class ResultsScreen extends StatelessWidget {
  final Map<String, int> pillMap;
  final FlutterTts flutterTts = FlutterTts();
  ResultsScreen(this.pillMap, {Key? key}) : super(key: key);
  bool isPlaying = false;

  _speak() async {
    if (isPlaying) {
      await flutterTts.stop();
      isPlaying = false;
      return;
    }

    // Set the speech rate, pitch, and language
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setPitch(1.2);
    await flutterTts.setLanguage("en-US");

    // Speak the text
    String pillMapText = '';
    pillMap.forEach((key, value) {
      if(value == 1) {
        pillMapText += '$value $key pill \n';
      } else {
        pillMapText += '$value $key pills \n';
      }
    });

// speak the text using flutterTts
    await flutterTts.speak(pillMapText);

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
        title: const Text('Detected Pills'),
        backgroundColor: Colors.teal,
      ),
      body: pillMap.isNotEmpty
          ? ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: pillMap.length,
            itemBuilder: (BuildContext context, int index) {
            String key = pillMap.keys.elementAt(index);
            int value = pillMap[key]!;
          return Card(
            color: myColor,
            elevation: 8.0,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    key,
                    style: const TextStyle(
                      fontSize: 35,
                      fontFamily: "Alata"
                    ),
                  ),
                  Text(
                    'Quantity: $value',
                    style: const TextStyle(
                      fontSize: 35,
                      fontFamily: "Alata"
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
          : const Center(
        child: Text(
          'No pills were found',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {
            _speak();
          },
          child: Icon(Icons.play_arrow, size: 80,),
          backgroundColor: Colors.teal,
          highlightElevation: 2.0,
          elevation: 6.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
