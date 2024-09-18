import 'package:flutter/material.dart';

class MainButtons extends StatelessWidget {
  MainButtons(
      {super.key,
      required this.text,
      required this.onTap,
      this.color,
      this.textColor});

  String text;
  Color? color;
  Color? textColor;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
