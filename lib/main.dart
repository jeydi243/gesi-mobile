import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login/constantes/values.dart';
import 'package:login/controllers/appController.dart';
import 'package:login/controllers/authController.dart';
import 'package:login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppController());
  Get.put(UserController());

  runApp(const GESI());
}

class GESI extends StatelessWidget {
  const GESI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: GesiTheme.of(context),
      home: Login(),
    );
  }
}
