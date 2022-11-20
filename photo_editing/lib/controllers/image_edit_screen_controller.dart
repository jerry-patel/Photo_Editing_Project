import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageEditScreenController extends GetxController {
  File pickedImagePath = Get.arguments; // Getting from home screen

  RxBool isLoading = false.obs;

  List bottomOptionList = [
    'Filter',
    'Crop',
    'Brightness',
  ];

  Future cropImage(context) async {
    isLoading(true);
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImagePath.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],

      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,

        ),
        IOSUiSettings(
          title: 'Crop',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if(croppedFile != null) {
      pickedImagePath = File(croppedFile.path);
    }
    isLoading(false);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}