import 'package:flutter/material.dart';
import 'package:gesi_mobile/screens/calendar.dart';
import 'package:gesi_mobile/screens/courses.dart';
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
            onTap: (i) => setState(() => _currentIndex = i),
            items: app.items
                .map((element) => SalomonBottomBarItem(
                      icon: Icon(element['icon']),
                      title: Text(element['title']),
                      selectedColor: element['selectedColor'],
                    ))
                .toList()),
      ),
      body: SafeArea(child: _child[_currentIndex] ?? Container()),
    );
  }
}
