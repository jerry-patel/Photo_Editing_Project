import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:photo_editing/screens/home_screen/home_screen.dart';


class SplashScreenController extends GetxController {

  var size = Get.size;
  RxDouble height = (Get.size.width * 0.05).obs;
  RxDouble width = (Get.size.width * 0.05).obs;


  goToNextScreen() {

    Timer(const Duration(seconds: 2), () {
      width = (size.width * 0.40).obs;
      Get.off(()=> HomeScreen());
    });
  }

  @override
  void onInit() {
    // Set Device Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    goToNextScreen();
    super.onInit();
  }

}