import 'package:flutter/material.dart';
import 'package:gesi_mobile/screens/calendar.dart';
import 'package:gesi_mobile/screens/courses/courses.dart';
import 'package:gesi_mobile/screens/profile.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'controllers/appController.dart';
import 'screens/dashboard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  static AppController app = Get.find();
  // ignore: prefer_final_fields
  final Map<int, Widget> _child = {
    0: Dashboard(),
    1: Courses(),
    2: Calendar(),
    3: Profile(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
            currentIndex: _currentIndex,
            duration: 1.seconds,
            onTap: (i) => setState(() => _currentIndex = i),
            selectedColorOpacity: .01,
            items: app.items
                .map((element) => SalomonBottomBarItem(
                    icon: Icon(element['icon']),
                    title: Text(element['title']),
                    selectedColor: element['selectedColor'],
                    unselectedColor:
                        Get.isDarkMode ? Colors.white : Colors.black54))
                .toList()),
      ),
      body: SafeArea(
          child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutCubicEmphasized,
        transitionBuilder: (child, an) => FadeTransition(
          // scale: an,
          opacity: an,
          child: child,
        ),
        duration: 1.seconds,
        child: _child[_currentIndex],
      )),
      // body: SafeArea(child: _child[_currentIndex] ?? Container(), left: true),
    );
  }
}
