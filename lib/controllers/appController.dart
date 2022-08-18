import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  RxBool isgesiWidgetDisplayed = true.obs;
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[
    {
      'icon': Icons.home,
      'title': "Home",
      'selectedColor': AppColors.accent,
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

  Future<Color?> findColor(String assetImage) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset(assetImage).image,
    );
    return paletteGenerator.dominantColor?.color;
  }
}
