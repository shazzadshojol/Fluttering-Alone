import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final AlignmentDirectional alignmentDirectional;
  final double height, weight;
  final Color color;
  final BoxShape boxShape;

  const CustomContainer(
      {super.key,
      required this.alignmentDirectional,
      required,
      required this.height,
      required this.weight,
      required this.color,
      required this.boxShape});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentDirectional,
      child: Container(
        height: height,
        width: weight,
        decoration: BoxDecoration(shape: boxShape, color: color),
      ),
    );
  }
}
