import 'package:flutter/material.dart';

class BorderStyles {
  static ShapeBorder modalBottomBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    );
  }
}