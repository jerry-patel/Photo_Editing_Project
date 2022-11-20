import 'package:flutter/material.dart';

class CustomSnackBar {
  static void snackBarModule({
    required BuildContext context,
    required String title,
    required bool action,
    String actionLabel = '',
    required Function() actionOnTap,
  }) {
    final snackBar = SnackBar(
      content: Text(title),
      behavior: SnackBarBehavior.floating,
      action: action == false
          ? null
          : SnackBarAction(
              label: actionLabel,
              onPressed: actionOnTap,
            ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}



/*CustomSnackBar.snackBarModule(
                        context: context,
                      title: 'SnackBar',
                      action: true,
                      actionLabel: 'Ok',
                      actionOnTap: () {
                          Get.back();
                      }
                    );*/