import 'package:flutter/material.dart';

List<MaterialColor> colors = [Colors.red, Colors.green, Colors.blue];

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
        Colors.redAccent,
        Colors.red[200],
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
  LinearGradient(
      colors: [
        Colors.green,
        Colors.green[700],
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
  LinearGradient(
      colors: [
        Colors.blue,
        Colors.blue[200],
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [0.3, 1],
      tileMode: TileMode.clamp),
];

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
