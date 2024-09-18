import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingPages({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Spacer(),
          Image.network(
            image,
            height: 350,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
