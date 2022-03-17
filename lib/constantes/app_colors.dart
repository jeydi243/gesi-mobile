part of values;

class AppColors {
  static const scaffoldBackground = Color(0xFFF1F5FA);
  static const primary = Color(0xFFF1F5FA); // gris blue
  static const second = Color(0xFFfbb02d);
  static const info = Color(0xFF7CB518);
  static const danger = Color(0xFF979797);
  static const warning = Colors.amber;
  static const error = Colors.red;
  static const success = Color(0xFFFFFFFF);
  static const white = Color(0xFFFFFFFF);
  static const silver = Color(0xffbdc3c7);
  static const gray_50 = Color.fromRGBO(17, 24, 39, .05);
  static const gray_100 = Color.fromRGBO(17, 24, 39, .1);
  static const gray_200 = Color.fromRGBO(17, 24, 39, .2);
  static const gray_300 = Color.fromRGBO(17, 24, 39, .3);
  static const gray_400 = Color.fromRGBO(17, 24, 39, .4);
  static const gray_500 = Color.fromRGBO(17, 24, 39, .5);
  static const gray_600 = Color.fromRGBO(17, 24, 39, .6);
  static const gray_700 = Color.fromRGBO(17, 24, 39, .7);
  static const gray_800 = Color.fromRGBO(17, 24, 39, .8);
  static const gray_900 = Color.fromRGBO(17, 24, 39, .9);
  static const blue_dark = Color.fromRGBO(13, 20, 67, 1);

  static const Map<int, Color> colorGreen = {
    50: Color.fromRGBO(16, 185, 129, .1),
    100: Color.fromRGBO(16, 185, 129, .2),
    200: Color.fromRGBO(16, 185, 129, .3),
    300: Color.fromRGBO(16, 185, 129, .4),
    400: Color.fromRGBO(16, 185, 129, .5),
    500: Color.fromRGBO(16, 185, 129, .6),
    600: Color.fromRGBO(16, 185, 129, .7),
    700: Color.fromRGBO(16, 185, 129, .8),
    800: Color.fromRGBO(16, 185, 129, .9),
    900: Color.fromRGBO(16, 185, 129, 1),
  };
  static MaterialColor colorCustom = MaterialColor(0xFF81B9D7, colorGreen);
  // This widget is the root of your application.

}
