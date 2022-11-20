import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editing/utils/image_rename_function.dart';
import 'dart:ui' as ui;

import 'image_edit_screen_controller.dart';


class BrightnessScreenController extends GetxController {
  File pickedImagePath = Get.arguments; // Getting from image edit screen

  double brightness = 0;
  double saturation = 1;
  double contrast = 1;

  GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey<ExtendedImageEditorState>();
  final GlobalKey repaintBoundryKey = GlobalKey();
  RxBool isLoading = false.obs;
  RxInt selectedOptionIndex = 0.obs;


  ImageEditScreenController imageEditScreenController = Get.find<ImageEditScreenController>();



  Future<void> captureFilterImage() async {
    String imageName = imageNameRenameFunction();
    log('imageName : $imageName');

    RenderRepaintBoundary boundary =
    repaintBoundryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    log("Image :$image");
    final directory = (await getApplicationDocumentsDirectory()).path;
    log('directory :$directory');

    ByteData? byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    File imgFile = File('$directory/$imageName.jpg');
    log('imgFile :$imgFile');
    await imgFile.writeAsBytes(pngBytes);

    imageEditScreenController.pickedImagePath = imgFile;

  }


  final defaultColorMatrix = const <double>[
    1, 0, 0, 0, 0, 0, 1,
    0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 1, 0
  ];

  List<double> calculationOfSaturation(double saturation) {
    final m = List<double>.from(defaultColorMatrix);
    final invSat = 1 - saturation;
    final R = 0.213 * invSat;
    final G = 0.715 * invSat;
    final B = 0.072 * invSat;

    m[0] = R + saturation;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + saturation;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + saturation;

    return m;
  }

  List<double> calculationOfContrast(double contrast) {
    final m = List<double>.from(defaultColorMatrix);
    m[0] = contrast;
    m[6] = contrast;
    m[12] = contrast;
    return m;
  }

  refreshUI() {
    isLoading(true);
    isLoading(false);
  }

}