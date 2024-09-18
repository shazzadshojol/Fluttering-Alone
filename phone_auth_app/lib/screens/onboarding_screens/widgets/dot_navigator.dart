import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotNavigation extends StatelessWidget {
  final PageController pageController;
  final Function(int) visitNextPage;

  const DotNavigation(
      {super.key, required this.visitNextPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        right: 160,
        child: SmoothPageIndicator(
          controller: pageController,
          onDotClicked: visitNextPage,
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: Colors.blue, dotHeight: 6),
        ));
  }
}
