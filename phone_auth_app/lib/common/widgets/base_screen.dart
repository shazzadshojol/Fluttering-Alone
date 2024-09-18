import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final padding = mediaQuery.padding;

    return Scaffold(
      backgroundColor: const Color(0xFF222831),
      body: Padding(
        padding: EdgeInsets.only(
          top: padding.top,
          bottom: padding.bottom,
          left: 16.0,
          right: 16.0, // Optional padding for content
        ),
        child: child,
      ),
    );
  }
}
