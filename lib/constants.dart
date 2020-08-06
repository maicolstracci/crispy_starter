import 'package:flutter/material.dart';

List<Gradient> gradients = [
  LinearGradient(
      colors: [
        Color(0xff74ebd5),
        Color(0xffACB6E5),
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
  LinearGradient(
      colors: [

        Colors.red[700],
        Colors.redAccent,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
  LinearGradient(
      colors: [
        Colors.grey[300],
        Colors.grey[500],
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
  LinearGradient(
      colors: [
        Colors.blue[900],
        Colors.blue[800],
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
];

Animatable<Decoration> background = TweenSequence<Decoration>([
  TweenSequenceItem(
    weight: 1.0,
    tween: DecorationTween(
      begin: BoxDecoration(
        gradient: gradients[0],
      ),
      end: BoxDecoration(
        gradient: gradients[1],
      ),
    ),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: DecorationTween(
      begin: BoxDecoration(
        gradient: gradients[1],
      ),
      end: BoxDecoration(
        gradient: gradients[2],
      ),
    ),
  ),
  TweenSequenceItem(
    weight: 1.0,
    tween: DecorationTween(
      begin: BoxDecoration(
        gradient: gradients[2],
      ),
      end: BoxDecoration(
        gradient: gradients[3],
      ),
    ),
  ),
]);

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
