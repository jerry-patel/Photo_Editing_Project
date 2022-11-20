import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/crop_image_screen_controller.dart';
import 'crop_image_screen_widgets.dart';

class CropImageScreen extends StatelessWidget {
  CropImageScreen({Key? key}) : super(key: key);
  final cropImageScreenController = Get.put(CropImageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Close & Check Button Module
            HeaderTwoButtonModule(),


          ],
        ),
      ),
    );
  }
}
