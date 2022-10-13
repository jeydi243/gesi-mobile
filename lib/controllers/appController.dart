import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool isgesiWidgetDisplayed = true.obs;
  RxInt currentIndex = RxInt(0);
  Rx<Color?> appBarColor = Rx<Color?>(Colors.transparent);
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[
    {
      'icon': Icons.home,
      'title': "Home",
      'selectedColor': AppColors.accentDark,
    },
    {
      'icon': Icons.favorite_border,
      'title': "Courses",
      'selectedColor': AppColors.accent,
    },
    {
      'icon': Icons.calendar_today,
      'title': "Calendar",
      'selectedColor': AppColors.accent,
    },
    {
      'icon': Icons.person,
      'title': "Profile",
      'selectedColor': AppColors.accent,
    },
  ].obs;

  changeDIsplayedAuthWidget() {
    isgesiWidgetDisplayed.value = !isgesiWidgetDisplayed.value;
  }

  updateAppBarColor() {
    findColor("assets/bg-1.jpg").then((value) {
      print("The color dominent before is ${appBarColor.value}");
      appBarColor.value = value;
      print("The color dominent after is $appBarColor.value");
    });
  }

  Future<Color?> findColor(String assetImage) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(assetImage).image,
    );
    return paletteGenerator.dominantColor?.color;
  }

  setCurrentIndex(int p1) {
    currentIndex.value = p1;
    update();
  }
}
