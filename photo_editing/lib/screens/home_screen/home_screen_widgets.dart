import 'package:flutter/material.dart';


class BottomSheetSingleItemModule extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final String labelText;
  final Color labelTextColor;
  final Function() onTap;

  const BottomSheetSingleItemModule({
    Key? key,
    required this.icon,
    required this.size,
    required this.color,
    required this.labelText,
    required this.labelTextColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: size, color: color),
            Text(labelText, style: TextStyle(color: labelTextColor)),
          ],
        ),
      ),
    );
  }
}
