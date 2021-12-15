import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class AnimationBackgroundColor extends StatefulWidget {
  AnimationBackgroundColor(
      {required this.childd, required this.color, Key? key})
      : super(key: key);
  MaterialColor color;
  Widget childd;

  @override
  _AnimationBackgroundColorState createState() =>
      _AnimationBackgroundColorState();
}

class _AnimationBackgroundColorState extends State<AnimationBackgroundColor>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SequenceAnimation sequenceAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: ColorTween(
                begin: widget.color.shade500, end: widget.color.shade200),
            from: Duration(milliseconds: 0),
            to: Duration(milliseconds: 2000),
            tag: 'color')
        .animate(controller);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
              child: widget.childd,
              decoration: BoxDecoration(
                color: sequenceAnimation['color'].value,
              ));
        });
  }
}
