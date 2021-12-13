import 'package:flutter/material.dart';

class GradientBackgroundcolor extends StatelessWidget {
  const GradientBackgroundcolor(
      {required this.color, required this.child, Key? key})
      : super(key: key);
  final MaterialColor color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.shade700, color.shade500, color.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.2, 0.6, 0.8])),
    );
  }
}
