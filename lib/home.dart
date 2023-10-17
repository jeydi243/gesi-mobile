// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/screens/calendar.dart';
import 'package:gesi_mobile/screens/courses/courses.dart';
import 'package:gesi_mobile/screens/profile.dart';
import 'package:gesi_mobile/screens/services/services.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'controllers/appController.dart';
import 'screens/dashboard.dart';

class HomeScreen extends GetView<AppController> {
  HomeScreen({Key? key}) : super(key: key);
  late PersistentTabController _controller;
  final Map<int, Widget> _child = {
    0: Dashboard(),
    1: Courses(),
    2: Calendar(),
    3: Profile(),
  };
  final List<Widget> children = [
    Dashboard(),
    Courses(),
    Services(),
    Calendar(),
    Profile(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Acceuil"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Parametres"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        title: ("Services"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_month_outlined),
        title: ("Calendrier"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: children,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.backgroundDark, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          border: Border(
            top: BorderSide(
              color: Get.theme.dividerColor,
              width: 1,
            ),
          )),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.easeInBack,
        duration: Duration(milliseconds: 400),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
