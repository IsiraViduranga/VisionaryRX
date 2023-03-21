import 'package:flutter/material.dart';

class BiogesicScreen extends StatelessWidget {
  const BiogesicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('Pill Information'),
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
                    image: AssetImage('assets/Biogesic.png'),
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
                  color: Colors.yellow[600],
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
                'Biogesic is a trade name for acetaminophen, which is used to treat pain and fever. It is an analgesic and antipyretic drug that comes in pill shape and is consumed orally. It is used to address a variety of conditions, including headaches, muscle aches, toothaches, menstrual cramps, and fever. For safe and effective use, follow your doctor\'s or the label\'s directions. Acetaminophen overdosage can cause liver damage, so adhere to the recommended dose.',
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

