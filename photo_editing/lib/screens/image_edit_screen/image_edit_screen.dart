import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/image_edit_screen_controller.dart';

import 'image_edit_screen_widgets.dart';

class ImageEditScreen extends StatelessWidget {
  ImageEditScreen({Key? key}) : super(key: key);
  final imageEditScreenController = Get.put(ImageEditScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        ()=> imageEditScreenController.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 85,
                child: Image.file(
                  imageEditScreenController.pickedImagePath,
                  alignment: Alignment.center,
                ),
              ),
              Expanded(
                flex: 15,
                child: BottomOptionListModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
