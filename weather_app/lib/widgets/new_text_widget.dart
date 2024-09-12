import 'package:flutter/material.dart';

class NewTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const NewTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text, // Directly use the text string
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
