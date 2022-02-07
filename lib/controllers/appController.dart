import 'package:get/get.dart';

class AppController extends GetxController{
  static AppController instance = Get.find();
  RxBool isgesiWidgetDisplayed = true.obs;


  changeDIsplayedAuthWidget(){
    isgesiWidgetDisplayed.value = !isgesiWidgetDisplayed.value;
  }

}