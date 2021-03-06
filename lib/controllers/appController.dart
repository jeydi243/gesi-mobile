import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool isgesiWidgetDisplayed = true.obs;
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[
    {
      'icon': Icons.home,
      'title': "Home",
      'selectedColor': Color.fromARGB(255, 29, 199, 43),
    },
    {
      'icon': Icons.favorite_border,
      'title': "Courses",
      'selectedColor': Color.fromARGB(255, 29, 199, 43),
    },
    {
      'icon': Icons.calendar_today,
      'title': "Calendar",
      'selectedColor': Color.fromARGB(255, 29, 199, 43),
    },
    {
      'icon': Icons.person,
      'title': "Profile",
      'selectedColor': Color.fromARGB(255, 29, 199, 43),
    },
  ].obs;

  changeDIsplayedAuthWidget() {
    isgesiWidgetDisplayed.value = !isgesiWidgetDisplayed.value;
  }
}
