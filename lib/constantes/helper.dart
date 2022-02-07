import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gesi_mobile/constantes/values.dart';

class Helper {
  static Widget divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: const <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: AppColors.gray_200,
              ),
            ),
          ),
          Text(
            'ou',
            style: TextStyle(
                color: AppColors.second, fontSize: AppSizes.textFontSize),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: AppColors.gray_200,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  static Widget openClose(bool open) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: AppColors.gray_200,
              ),
            ),
          ),
          open
              ? Icon(
                  Icons.keyboard_arrow_up,
                  size: 30,
                  color: Colors.black,
                )
              : Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.black,
                ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: AppColors.gray_200,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  static Widget topCardWidget(String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gros con',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            //SizedBox(height: 15),
            Text(
              'The Rock',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          'He asks, what your name is. But!',
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  static Widget bottomCardWidget() {
    return Text(
      'It doesn\'t matter \nwhat your name is.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

  static void showSnack(
      {required String title,
      required String message,
      Duration duration = const Duration(seconds: 3),
      required IconData icon,
      SnackPosition position = SnackPosition.TOP,
      Color bgColor = Colors.black,
      required String to,
      double barBlur = 0.0,
      double overlayBlur = 0.0,
      required Widget main}) {
    Get.snackbar(title, message,
        borderRadius: 10,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: position,
        colorText: AppColors.white,
        icon: Icon(
          icon,
          color: AppColors.second,
        ),
        shouldIconPulse: false,
        barBlur: barBlur,
        overlayBlur: barBlur,
        backgroundColor: bgColor,
        duration: duration ?? 3.seconds,
        mainButton: to == "logout"
            ? TextButton(onPressed: () => 1, child: Text('Se deconnecter'))
            : null,
        onTap: (snack) {});
  }

  static showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 5), child: Text("Un instant...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static String getRandomString(int length) {
    Random _rnd = Random();
    String _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  static Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
