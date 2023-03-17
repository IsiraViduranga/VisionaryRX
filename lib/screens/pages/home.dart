import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visionaryrx/screens/bioflu.dart';
import 'package:visionaryrx/screens/scan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 16,
                top: 25,
                bottom: 30,
              ),
              child: const Center(
                child: Text(
                  'VisionaryRx',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const BiofluScreen(),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      color: Color(0xFFDCEDF9),
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
                    color: Color.fromARGB(255, 183, 220, 207),
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
                    child: const BiofluScreen(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5E1E9),
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
                      Icon(Icons.book),
                      Text(
                        'Records',
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
