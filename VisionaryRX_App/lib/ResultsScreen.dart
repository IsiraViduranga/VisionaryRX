import 'package:flutter/material.dart';

Color myColor = const Color(0xFFe6f7eb);

class ResultsScreen extends StatelessWidget {
  final Map<String, int> pillMap;

  const ResultsScreen(this.pillMap, {Key? key}) : super(key: key);
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
                      fontSize: 30,
                      fontFamily: "Alata"
                    ),
                  ),
                  Text(
                    'Quantity: $value',
                    style: const TextStyle(
                      fontSize: 30,
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
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
