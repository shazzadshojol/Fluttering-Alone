import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_quiz_app/widgets/circular-buttons.dart';
import 'package:small_quiz_app/widgets/game_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircularIcons(
            icon: CupertinoIcons.person_fill,
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CircularIcons(
              icon: CupertinoIcons.heart_fill,
              onTap: () {},
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Let\'s Play!',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                'Be the top!!',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const GameTile(
                color1: Colors.deepOrange,
                color2: Colors.yellowAccent,
                icon: CupertinoIcons.check_mark,
                levelText: 'Level 1',
                levelName: 'Travel Newbie',
                imageUrl: 'https://i.imgur.com/9bCbWz7.png',
                position: 110,
                imageSize: 2.1,
                margin: EdgeInsets.only(top: 80),
              ),
              GameTile(
                color1: Colors.blue.shade300,
                color2: Colors.blueAccent,
                icon: CupertinoIcons.play_arrow_solid,
                levelText: 'Level 2',
                levelName: 'Continue',
                imageUrl: 'https://i.imgur.com/Ke46Qz9.png',
                position: 140,
                imageSize: 2.2,
                margin: const EdgeInsets.only(top: 100),
              ),
              GameTile(
                color1: Colors.pink.shade300,
                color2: Colors.pinkAccent.shade400,
                icon: CupertinoIcons.lock_fill,
                levelText: 'Level 3',
                levelName: 'Experienced',
                imageUrl: 'https://i.imgur.com/gkXXOON.png',
                position: 110,
                imageSize: 2.2,
                margin: EdgeInsets.only(top: 80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
