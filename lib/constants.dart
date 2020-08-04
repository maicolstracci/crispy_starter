import 'package:flutter/material.dart';

List<MaterialColor> colors = [Colors.red,Colors.green,Colors.blue];

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}