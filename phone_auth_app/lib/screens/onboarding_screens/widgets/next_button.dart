import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;

  const NextButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
      ),
    );
  }
}
