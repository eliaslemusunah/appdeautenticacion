import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String letter;
  final Color color;
  final Color textColor;

  const CircleWidget({
    super.key,
    required this.letter,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Text(
        letter,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 27,
          color: textColor,
        ),
      ),
    );
  }
}