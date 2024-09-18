import 'package:flutter/material.dart';
import 'package:small_quiz_app/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,home: HomeScreen(),);
  }
}
