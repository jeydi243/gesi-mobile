import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/screens/calendar.dart';
import 'package:gesi_mobile/screens/courses/courses.dart';
import 'package:gesi_mobile/screens/profile.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'controllers/appController.dart';
import 'screens/dashboard.dart';

class HomeScreen extends GetView<AppController> {
  HomeScreen({Key? key}) : super(key: key);
  late PersistentTabController _controller;
  // ignore: prefer_final_fields
  final Map<int, Widget> _child = {
    0: Dashboard(),
    1: Courses(),
    2: Calendar(),
    3: Profile(),
  };
  final List<Widget> children = [
    Dashboard(),
    Courses(),
    // Calendar(),
    // Profile(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
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
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );

    // return Scaffold(
    //   backgroundColor: Get.theme.scaffoldBackgroundColor,
    //   bottomNavigationBar: Obx(
    //     () => SalomonBottomBar(
    //         currentIndex: controller.currentIndex.value,
    //         duration: 1.seconds,
    //         onTap: controller.setCurrentIndex,
    //         selectedColorOpacity: .01,
    //         items: controller.items
    //             .map((element) => SalomonBottomBarItem(
    //                 icon: Icon(element['icon']),
    //                 title: Text(element['title']),
    //                 selectedColor: AppColors.accent,
    //                 unselectedColor:
    //                     Get.isDarkMode ? Colors.black12 : Colors.white))
    //             .toList()),
    //   ),
    //   body: SafeArea(
    //       child: AnimatedSwitcher(
    //     switchInCurve: Curves.easeInOutCubicEmphasized,
    //     transitionBuilder: (child, an) => FadeTransition(
    //       opacity: an,
    //       child: child,
    //     ),
    //     duration: 1.seconds,
    //     child: _child[controller.currentIndex],
    //   )),
    //   // body: SafeArea(child: _child[_currentIndex] ?? Container(), left: true),
    // );
  }
}
