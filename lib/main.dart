import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/controllers/appController.dart';
import 'package:gesi_mobile/controllers/authController.dart';
import 'package:gesi_mobile/login.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Get.put(AppController());
  Get.put(AuthController());

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
      home: gesi(),
    );
  }
}
