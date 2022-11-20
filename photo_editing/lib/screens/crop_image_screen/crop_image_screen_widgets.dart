import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_editing/controllers/crop_image_screen_controller.dart';
import 'package:photo_editing/utils/custom_alert_dialog.dart';


class HeaderTwoButtonModule extends StatelessWidget {
  HeaderTwoButtonModule({Key? key}) : super(key: key);
  final cropImageScreenController = Get.find<CropImageScreenController>();

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
          onPressed: (){},
          // onPressed: () async =>
          // await cropImageScreenController.captureFilterImage().then(
          //       (value) => Get.back(),
          // ),
          icon: const Icon(
            Icons.check_rounded,
            color: Colors.white,
          ),
        ),

      ],
    );
  }
}
