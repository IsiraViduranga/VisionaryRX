import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, int> pillMap;

  const ResultsScreen(this.pillMap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: ListView.builder(
        itemCount: pillMap.length,
        itemBuilder: (BuildContext context, int index) {
          String key = pillMap.keys.elementAt(index);
          int value = pillMap[key]!;
          return ListTile(
            title: Text(key),
            subtitle: Text('Count: $value'),
          );
        },
      ),
    );
  }
}
