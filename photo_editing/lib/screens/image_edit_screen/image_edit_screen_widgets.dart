import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/image_edit_screen_controller.dart';
import 'package:photo_editing/screens/brightness_screen/brightness_screen.dart';
import 'package:photo_editing/screens/image_filter_screen/image_filter_screen.dart';
import 'package:photo_editing/utils/extension.dart';
import 'package:image_cropper/image_cropper.dart';


class BottomOptionListModule extends StatelessWidget {
  BottomOptionListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ImageEditScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.builder(
          itemCount: screenController.bottomOptionList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return bottomOptionListTile(i, context);
          },
        ),
      ],
    ).commonAllSidePadding(padding: 10);
  }

  Widget bottomOptionListTile(int i, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(i == 0) {
          Get.to(()=> ImageFilterScreen(),
          arguments: screenController.pickedImagePath
          )!.then((value) {
            screenController.loadUI();
          });
        } else if(i == 1) {
          await screenController.cropImage(context);
          /*Get.to(()=> CropImageScreen(),
              arguments: screenController.pickedImagePath
          )!.then((value) {
            screenController.loadUI();
          });*/
        } else if(i == 2) {
          Get.to(()=> BrightnessScreen(),
              arguments: screenController.pickedImagePath
          )!.then((value) {
            screenController.loadUI();
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          screenController.bottomOptionList[i],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }


}
