import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gesi_mobile/authentication.dart';
import 'package:gesi_mobile/home.dart';
import 'package:gesi_mobile/models/user.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> user = User.gt().obs;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
// or new Dio with a BaseOptions instance.

  var options = BaseOptions(
    baseUrl: 'http://localhost:3000/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  @override
  void onReady() {
    super.onReady();
    Dio dio = Dio(options);
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
    try {} catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    showLoading();
    try {} catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {}

  void showLoading() {}

  _addUserToFirestore(String userId) {}

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {}
}
