import 'package:flutter/material.dart';
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
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
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
      showLoading();
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

  void showLoading() {}

  _clearControllers() {
    username.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {}
}
