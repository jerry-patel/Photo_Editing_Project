import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editing/controllers/home_screen_controller.dart';
import 'package:photo_editing/screens/image_edit_screen/image_edit_screen.dart';
import 'package:photo_editing/utils/snackbar_function.dart';

import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.put(HomeScreenController());
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () => imagePickerBottomSheet(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Select Image',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void imagePickerBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: BottomSheetSingleItemModule(
                  onTap: () async {
                    Get.back();
                    await imagePickerFromCamera();
                  },
                  icon: Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 50,
                  labelText: 'Camera',
                  labelTextColor: Colors.white,
                ),
              ),
              Expanded(
                child: BottomSheetSingleItemModule(
                  onTap: () async {
                    Get.back();
                    await imagePickerFromGallery();
                  },
                  icon: Icons.image_rounded,
                  color: Colors.white,
                  size: 50,
                  labelText: 'Gallery',
                  labelTextColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> imagePickerFromCamera() async {
    try {
      var photo = await imagePicker.pickImage(source: ImageSource.camera);

      if(photo!.path.toString() != "") {
        homeScreenController.pickerImage = File(photo.path);
        log('Picked Image Camera:${homeScreenController.pickerImage.path}');
        Get.to(
          () => ImageEditScreen(),
          arguments: homeScreenController.pickerImage,
        );
      } else {
        log('Image not picked');
      }

    } catch(e) {
      log('imagePickerFromCamera Error :$e');
    }
  }

  Future<void> imagePickerFromGallery() async {
    try {
      var photo = await imagePicker.pickImage(source: ImageSource.gallery);

      if(photo!.path.toString() != "") {
        homeScreenController.pickerImage = File(photo.path);
        log('Picked Image Gallery:${homeScreenController.pickerImage.path}');
        Get.to(
              () => ImageEditScreen(),
          arguments: homeScreenController.pickerImage,
        );
      } else {
        log('Image not picked');
      }

    } catch(e) {
      log('imagePickerFromCamera Error :$e');
    }
  }
}
