import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_editing/controllers/image_edit_screen_controller.dart';
import 'package:photo_editing/utils/image_rename_function.dart';
import 'dart:ui' as ui;


class ImageFilterScreenController extends GetxController {
  File pickedImagePath = Get.arguments; // Getting from image edit screen

  ImageEditScreenController imageEditScreenController = Get.find<ImageEditScreenController>();

  final GlobalKey repaintKey = GlobalKey();

  final lightColorFilters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
          (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final lightFilterColor = ValueNotifier<Color>(Colors.white);

  void onFilterChanged(Color value) {
    lightFilterColor.value = value;
  }


  Future<void> captureFilterImage() async {
    String imageName = imageNameRenameFunction();
    log('imageName : $imageName');

    RenderRepaintBoundary boundary =
    repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
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


}