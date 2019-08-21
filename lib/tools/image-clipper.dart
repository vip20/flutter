import 'dart:ui';

import 'package:flutter/material.dart';

class TitleImageClipper extends CustomClipper<Path> {
  TitleImageClipper({this.borderRadius = 5});
  final double borderRadius;
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height / 2.0;
    double maxRadius = 50.0;
    double minWidth = 18.0;
    double trimHeight = 0.8;
    final path = Path()
      ..moveTo(0.0, borderRadius)
      ..lineTo(0.0, h - borderRadius)
      ..quadraticBezierTo(0.0, h, borderRadius, h)
      ..lineTo(minWidth - borderRadius, h)
      ..quadraticBezierTo(minWidth, h, minWidth, h - borderRadius)
      ..lineTo(minWidth, h * trimHeight + borderRadius)
      ..quadraticBezierTo(
          minWidth, h * trimHeight, minWidth + borderRadius, h * trimHeight)
      ..lineTo(w - maxRadius, h * trimHeight)
      ..quadraticBezierTo(w, h * trimHeight, w, h * trimHeight - maxRadius)
      ..lineTo(w, borderRadius)
      ..quadraticBezierTo(w, 0.0, w - borderRadius, 0.0)
      ..lineTo(borderRadius, 0.0)
      ..quadraticBezierTo(0.0, 0.0, 0.0, borderRadius)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
