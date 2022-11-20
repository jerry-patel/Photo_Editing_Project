import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.size.height,
        width: Get.size.width,
        child: Obx(
          ()=> AnimatedContainer(
            duration: const Duration(seconds: 3),
            curve: Curves.fastOutSlowIn,
            height: splashScreenController.width.value,
            width: splashScreenController.width.value,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
