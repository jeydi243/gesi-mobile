part of values;

final emptyState = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset("assets/nothing_here.png"),
    Padding(
        padding: EdgeInsets.only(top: 8.0),
        child:
            Text('Nothing here. Come back soon!', textAlign: TextAlign.center))
  ],
);

class GesiTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.colorCustom,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.second,
          error: AppColors.error,
          primary: AppColors.colorCustom,
          brightness: Brightness.light),
      primaryColorDark: AppColors.colorCustom[900],
      bottomAppBarColor: AppColors.colorCustom[900],
      scaffoldBackgroundColor: AppColors.background,
      errorColor: AppColors.error,
      dividerColor: AppColors.colorCustom,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          helperStyle: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: AppColors.error)),
          errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: AppColors.error)),
          errorStyle: TextStyle(color: AppColors.error, fontSize: 10)),
      appBarTheme: theme.appBarTheme.copyWith(
        color: AppColors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.k2d(
          color: AppColors.primary,
          fontSize: 19,
        ),
      ),
      textTheme: GoogleFonts.k2dTextTheme().copyWith(
        headline1: TextStyle(
            fontWeight: FontWeight.w100, color: Colors.black, fontSize: 30),
        headline2: TextStyle(
            fontWeight: FontWeight.w200, color: Colors.black, fontSize: 26),
        headline3: TextStyle(
            fontWeight: FontWeight.w300, color: Colors.black, fontSize: 24),
        headline4: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.black, fontSize: 20),
        headline5: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
        button: theme.textTheme.button?.copyWith(
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.normal),
        caption: theme.textTheme.caption?.copyWith(
            fontSize: 34,
            color: AppColors.primary,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.normal),
      ),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.colorCustom,
      ),
      iconTheme: theme.iconTheme.copyWith(color: AppColors.gray_100, size: 24),
      primaryIconTheme: IconThemeData(color: AppColors.second, size: 24),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            enableFeedback: true,
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(
                Size(Get.width / 4, Get.height * .05)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(color: AppColors.white))),
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: AppColors.second),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          selectedLabelStyle: GoogleFonts.k2d(),
          selectedItemColor: AppColors.second),
    );
  }
}
