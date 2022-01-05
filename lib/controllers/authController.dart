import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/authentication.dart';
import 'package:login/home.dart';
import 'package:login/models/user.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rx<User> user = User.gt().obs;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    super.onReady();
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
