import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:visionaryrx/screens/pages/home.dart';
import 'package:visionaryrx/screens/pages/search.dart';
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
    SearchPage(),
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[bottomNavIndex],
<<<<<<< Updated upstream
              style: TextStyle(
                color: Colors.black,
=======
              style: const TextStyle(
                color: Colors.white,
>>>>>>> Stashed changes
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
<<<<<<< Updated upstream
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30.0,
            )
=======
>>>>>>> Stashed changes
          ],
        ),
        backgroundColor: Colors.teal,
        elevation: 0.0,
      ),
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
        child: Image.asset(
          'assets/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: Colors.teal,
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
