import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/brightness_screen_controller.dart';
import 'brightness_screen_widgets.dart';

class BrightnessScreen extends StatelessWidget {
  BrightnessScreen({Key? key}) : super(key: key);
  final brightnessScreenController = Get.put(BrightnessScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => brightnessScreenController.isLoading.value
            ? Container()
            : SafeArea(
                child: Column(
                  children: [
                    // Close & Check Button Module
                    BrightnessScreenAppBarModule(),

                    ImageShowModule(),

                    SliderOptionModule(),

                    BottomSelectionOptionModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
