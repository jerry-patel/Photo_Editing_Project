import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/brightness_screen_controller.dart';
import 'package:photo_editing/utils/custom_alert_dialog.dart';
import 'package:photo_editing/utils/extension.dart';

class BrightnessScreenAppBarModule extends StatelessWidget {
  BrightnessScreenAppBarModule({Key? key}) : super(key: key);
  final screenController = Get.find<BrightnessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => CustomAlertDialog().showAlertDialog(
            context: context,
            title: 'Are you sure you want to exit ?',
            negativeText: 'No',
            negativeOnTap: () => Get.back(),
            positiveText: 'Yes',
            positiveOnTap: () {
              Get.back();
              Get.back();
            },
          ),
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.white,
          ),
        ),

        IconButton(
          onPressed: () async {
            await screenController.captureFilterImage().then(
                  (value) => Get.back(),
            );
          },
          icon: const Icon(
            Icons.check_rounded,
            color: Colors.white,
          ),
        ),

      ],
    );
  }
}


class ImageShowModule extends StatelessWidget {
  ImageShowModule({Key? key}) : super(key: key);
  final screenController = Get.find<BrightnessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: RepaintBoundary(
              key: screenController.repaintBoundryKey,
              child: Container(
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(screenController.calculationOfContrast(screenController.contrast)),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.matrix(screenController.calculationOfSaturation(screenController.saturation)),
                    child: ExtendedImage(
                      key: screenController.editorKey,
                      image: ExtendedFileImageProvider(screenController.pickedImagePath),
                      color: screenController.brightness > 0
                          ? Colors.white.withOpacity(screenController.brightness)
                          : Colors.black.withOpacity(-screenController.brightness),
                      colorBlendMode: screenController.brightness > 0 ? BlendMode.lighten : BlendMode.darken,

                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SliderOptionModule extends StatelessWidget {
  SliderOptionModule({Key? key}) : super(key: key);
  final screenController = Get.find<BrightnessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenController.selectedOptionIndex.value == 0
      ? Slider(
        value: screenController.brightness,
        onChanged: (value) {
          screenController.brightness = value;
          screenController.refreshUI();
        },
      )
      : screenController.selectedOptionIndex.value == 1
      ? Slider(
        value: screenController.saturation,
        onChanged: (value) {
          screenController.saturation = value;
          screenController.refreshUI();
        },
      )
      : Slider(
        value: screenController.contrast,
        onChanged: (value) {
          screenController.contrast = value;
          screenController.refreshUI();
        },
      ),
    ).commonAllSidePadding(padding: 10);
  }
}



class BottomSelectionOptionModule extends StatelessWidget {
  BottomSelectionOptionModule({Key? key}) : super(key: key);
  final screenController = Get.find<BrightnessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              screenController.selectedOptionIndex.value = 0;
              screenController.refreshUI();
            },
            child: const Text(
              'Brightness',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              screenController.selectedOptionIndex.value = 1;
              screenController.refreshUI();
            },
            child: const Text(
              'Situration',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              screenController.selectedOptionIndex.value = 2;
              screenController.refreshUI();
            },
            child: const Text(
              'Contrast',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

