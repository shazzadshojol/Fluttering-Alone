import 'package:flutter/material.dart';
import 'package:phone_auth_app/utils/constants/app_colors.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 10,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          'Skip',
          style: TextStyle(
              fontSize: 16,
              color: AppColors.primary,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
