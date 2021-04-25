import 'package:flutter/material.dart';
import 'dart:math';

class StarPainter extends CustomPainter {
  Paint _paint;
  Path _path = Path();
  int n;
  double R;
  double r;
  StarPainter(
      {this.n = 5, this.R = 50, this.r = 25, Color color = Colors.red}) {
    _paint = Paint()
      ..color = color
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(nStarPath(n, R, r), _paint);
    //canvas.translate(50, 50);
    // canvas.drawPath(nStarPath(8, 50, 10), _paint);
    // canvas.translate(0, 100);
    // canvas.drawPath(nStarPath(12, 50, 25), _paint);
    // canvas.translate(0, 100);
    // canvas.drawPath(nStarPath(12, 50, 25, rotate: pi), _paint);
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) => false;

  Path nStarPath(int num, double R, double r, {dx = 0, dy = 0, rotate = 0}) {
    _path.reset();
    double perRad = 2 * pi / num;
    double radA = perRad / 2 / 2 + rotate;
    double radB = 2 * pi / (num - 1) / 2 - radA / 2 + radA + rotate;
    _path.moveTo(cos(radA) * R + dx, -sin(radA) * R + dy);

    for (int i = 0; i < num; i++) {
      _path.lineTo(
          cos(radA + perRad * i) * R + dx, -sin(radA + perRad * i) * R + dy);
      _path.lineTo(
          cos(radB + perRad * i) * r + dx, -sin(radB + perRad * i) * r + dy);
    }
    _path.close();
    return _path;
  }
}
