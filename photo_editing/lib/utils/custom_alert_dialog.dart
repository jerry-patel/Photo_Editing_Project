import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  void showAlertDialog(
      {
        required BuildContext context,
        required String title,
        required String positiveText,
        required Function() positiveOnTap,
        required String negativeText,
        required Function() negativeOnTap,
      }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: [

            // Cancel Button
            CupertinoDialogAction(
              onPressed: negativeOnTap,
              child: Text(negativeText),
            ),

            // Yes Button
            CupertinoDialogAction(
              onPressed: positiveOnTap,
              child: Text(positiveText),
            ),

          ],
        );
      },
    );
  }
}