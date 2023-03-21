import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visionaryrx/screens/bioflu.dart';
import 'package:visionaryrx/screens/drugpillinformation.dart';
import 'package:visionaryrx/screens/pages/home.dart';
import 'package:visionaryrx/screens/scan_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomNavIndex = 0;

  //List of the pages
  List<Widget> pages = const [
    HomePage(),
    DrugPage(),
  ];

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.search,
  ];

  //List of the pages titles
  List<String> titleList = const [
    'Home',
    'Search',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const ScanPage(),
                  type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Colors.teal,
        child: Image.asset(
          'assets/code-scan-two.png',
          height: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Colors.teal,
          activeColor: Colors.teal,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              bottomNavIndex = index;
            });
          }),
    );
  }
}
