import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visionaryrx/screens/drugpillinformation.dart';
import 'package:visionaryrx/screens/pages/record.dart';
import 'package:visionaryrx/screens/scan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 0,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const DrugPage(),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEDF9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.medical_services),
                        Text(
                          'Medicines',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // colum 2----------------------------------------------------
            const SizedBox(height: 20), // add spacing between rows
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const ScanPage(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 183, 220, 207),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.qr_code_scanner),
                      Text(
                        'Scanner',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),

            //  colum 3 ----------------------------------------
            const SizedBox(height: 20), // add spacing between rows
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const RecordPage(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5E1E9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.settings),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
