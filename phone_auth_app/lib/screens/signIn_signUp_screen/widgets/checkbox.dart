import 'package:flutter/material.dart';
import 'package:phone_auth_app/utils/constants/app_colors.dart';

class MyCheckBox extends StatefulWidget {
  final String? text; // Optional text

  const MyCheckBox({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          activeColor: AppColors.primary,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
        if (widget.text != null) // Safely check for null
          Text(
            widget.text!,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
      ],
    );
  }
}
