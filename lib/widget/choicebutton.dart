import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasgradient;
  final IconData icon;

  const ChoiceButton(
      {super.key,
      required this.width,
      required this.height,
      required this.size,
      required this.color,
      required this.icon,
      required this.hasgradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: hasgradient
              ? LinearGradient(colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).hintColor
                ])
              : LinearGradient(colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).hintColor
                ]),
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(3, 3))
          ]),
      child: Icon(icon, color: color, size: size),
    );
  }
}
