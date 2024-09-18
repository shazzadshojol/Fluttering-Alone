import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final Color color1, color2;
  final IconData icon;
  final String levelText, levelName, imageUrl;
  final double position, imageSize;
  final EdgeInsetsGeometry margin;

  const GameTile({
    super.key,
    required this.color1,
    required this.color2,
    required this.icon,
    required this.levelText,
    required this.levelName,
    required this.imageUrl,
    required this.position,
    required this.imageSize,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: margin,
        child: Material(
          child: Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    levelText,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    levelName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
          left: position,
          child: Image.network(
            imageUrl,
            scale: imageSize,
          ))
    ]);
  }
}
