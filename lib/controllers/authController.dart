import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gesi_mobile/authentication.dart';
import 'package:gesi_mobile/home.dart';
import 'package:gesi_mobile/models/user.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> user = User.gt().obs;
  Dio dio = Dio();
  RxBool isLoggedIn = false.obs;
  final username = TextEditingController(text: "dfdfdfhh").obs;
  final password = TextEditingController(text: "jjjjjjjj").obs;
  final profileTabs = [
    {"title": "Stats", "icon": Icons.stacked_bar_chart_outlined},
    {"title": "Courses", "icon": Icons.book},
    {"title": "Messages", "icon": Icons.book},
  ].obs;
// or new Dio with a BaseOptions instance.

  var options = BaseOptions(
    baseUrl: 'http://localhost:3000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  @override
  void onReady() {
    super.onReady();
    dio = Dio(options);
    ever(user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void signIn() async {
    try {
      Get.to(() => HomeScreen(),
          transition: Transition.native, duration: 1.seconds);
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
      _clearControllers();
    }
  }

  Future<void> signUp() async {
    try {
      final res = await dio.post("/users/login",
          data: {username: username.value, password: password.value});
      Get.snackbar("Connexion", "Awwwwww ${res.data['message']}");
      _clearControllers();
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {}

  Future<void> updateProfile() async {
    await HapticFeedback.mediumImpact();
    print("Okay");
    Get.toNamed('/updateprofile');
  }

  _clearControllers() {
    username.value.clear();
    password.value.clear();
  }

  updateUserData(Map<String, dynamic> data) {}
}
