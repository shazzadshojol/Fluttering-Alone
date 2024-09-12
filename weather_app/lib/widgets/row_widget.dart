import 'package:flutter/material.dart';
import 'package:weather_app/widgets/new_text_widget.dart';

class RowWidget extends StatelessWidget {
  final String text;
  final String time;
  final String imagePath;

  const RowWidget({
    super.key,
    required this.text,
    required this.imagePath,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          scale: 8,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewTextWidget(
              text: text, // Directly pass the text
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            NewTextWidget(
              text: time, // Directly pass the time
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
