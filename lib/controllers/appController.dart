// ignore_for_file: file_names, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/models/classe.dart';
import 'package:gesi_mobile/models/event.dart';
import 'package:gesi_mobile/models/service.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
// import 'package:dio/src/response.dart'
import 'package:get/get_connect/http/src/response/response.dart'
    as GetxResponse;

class AppController extends GetxController {
  static AppController instance = Get.find();
  final options = BaseOptions(
    baseUrl: dotenv.env['BASE_URL'] ?? '',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 10),
  );
  late Dio dio;
  @override
  void onInit() {
    super.onInit();
    dio = Dio(options);
  }

  // call api with dio
  Future<List<Classe>?> getClasses() async {
    try {
      final response = await dio.get('/classes');
      // final List<Classe> classes = (response.);kc
      print('The response is ${response.data}');
      // return (response.data as List).map((e) => Classe.fromJson(e)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  late Rx<List<Classe>?> _classes = Rx<List<Classe>?>(null);
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

  get classes => _classes.value;

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

  Future<Event?> getOneEvent(String eventID) async {
    try {
      dynamic data = await dio.get<Event>('/lookups', data: {'ig': eventID});
      print(data);
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<Event?> listenToMe(String eventID) async* {
    while (true) {
      await Future.delayed(5.seconds);
      yield await getOneEvent(eventID);
    }
  }

  Future<List<StudentService>?> getServices() async {
    List<StudentService> servicesList = [];
    try {
      dynamic data = await dio.get<List<StudentService>>('/services');
      print(data);
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> requestService(studentID, ServiceID) async {
    try {
      dynamic result = await dio.post('/service', data: {ServiceID});
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
