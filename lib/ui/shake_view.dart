import 'dart:math' as maths;

import 'package:flutter/material.dart';

class ShakeView extends StatelessWidget {
  final Widget child;
  final ShakeController controller;
  final Animation _anim;
  final int tiltAngle;

  ShakeView(
      {@required this.child, @required this.controller, this.tiltAngle = 20})
      : _anim = IntTween(begin: 0, end: tiltAngle).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.bounceIn,
        ));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) => Transform.rotate(
          child: child,
          origin: Offset(0.0, 0.0),
          angle: (maths.pi / 180) * _anim.value),
    );
  }
}

class ShakeController extends AnimationController {
  ShakeController({@required TickerProvider vsync, Duration duration})
      : super(vsync: vsync, duration: duration);

  shake() async {
    await this.forward().orCancel;
    await this.reverse().orCancel;
  }
}
