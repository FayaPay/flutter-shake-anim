import 'dart:math' as maths;

import 'package:flutter/material.dart';

class ShakeView extends StatelessWidget {
  final Widget child;
  final ShakeViewController controller;
  final Animation _first_anim, _second_anim;

  ShakeView({@required this.child, @required this.controller})
      : _first_anim = IntTween(begin: 0, end: 10).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.5, curve: Curves.easeIn),
        )),
        _second_anim = IntTween(begin: 10, end: -10).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1.0, curve: Curves.easeOut),
        ));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) => Transform.rotate(
          child: child,
          origin: Offset(0.0, 0.0),
          angle: (maths.pi / 180) * _first_anim.value),
    );
  }
}

class ShakeViewController extends AnimationController {
  ShakeViewController({@required TickerProvider vsync, Duration duration})
      : super(vsync: vsync, duration: duration);

  shake() async {
    await this.forward().orCancel;
    await this.reverse().orCancel;
  }
}
