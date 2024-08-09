import 'package:flutter/material.dart';

class SizeConfing {
  static double? screenHeight;
  static double? screenWidth;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;

    // ignore: unrelated_type_equality_checks
    defaultSize = orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width * 0.024
        : MediaQuery.of(context).size.width * 0.024;
  }
}
