import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/image_filter_screen_controller.dart';
import 'package:photo_editing/utils/custom_alert_dialog.dart';
import 'image_filter_screen_widgets.dart';


class ImageFilterScreen extends StatelessWidget {
  ImageFilterScreen({Key? key}) : super(key: key);
  final imageFilterScreenController = Get.put(ImageFilterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Close & Check Button Module
            Row(
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
                  onPressed: () async =>
                  await imageFilterScreenController.captureFilterImage().then(
                        (value) => Get.back(),
                  ),
                  icon: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                  ),
                ),

              ],
            ),

            // Image Show Module
            Expanded(child: _buildPhotoWithFilter()),

            // Image Filter List Module
            _buildFilterSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: imageFilterScreenController.lightFilterColor,
      builder: (context, value, child) {
        final color = value as Color;
        return RepaintBoundary(
          key: imageFilterScreenController.repaintKey,
          child: Image.file(
            imageFilterScreenController.pickedImagePath,
            color: color.withOpacity(0.5),
            colorBlendMode: BlendMode.color,
            alignment: Alignment.center,
            // fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: imageFilterScreenController.onFilterChanged,
      filters: imageFilterScreenController.lightColorFilters,
    );
  }
}
