import 'package:flutter/material.dart';

class CircularIcons extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircularIcons({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(100)),
        child: Icon(
          icon,
          size: 30,
          color: Colors.blue,
        ),
      ),
    );
  }
}
