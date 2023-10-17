import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gesi_mobile/constantes/values.dart';
import 'package:gesi_mobile/controllers/appController.dart';
import 'package:gesi_mobile/controllers/authController.dart';
import 'package:gesi_mobile/login.dart';
import 'package:gesi_mobile/screens/updateprofile.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Get.put(AppController());
  Get.put(AuthController());
  // MicroInit();
  runApp(const GESI());
}

class GESI extends StatelessWidget {
  const GESI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Get.isDarkMode
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light);
    return GetMaterialApp(
      title: 'Gesi',
      debugShowCheckedModeBanner: false,
      routes: {'/updateprofile': (context) => UpdateProfile()},
      theme: GesiTheme.light(context),
      darkTheme: GesiTheme.dark(context),
      themeMode: ThemeMode.system,
      defaultTransition: Transition.fadeIn,
      home: gesi(),
    );
  }
}
