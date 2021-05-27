import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndicateBarWidget extends GetView {
  final Color color;
  final double value;
  final bool vertical;
  final double size;
  final double thickness;
  IndicateBarWidget(
      {this.color: Colors.red,
      required this.value,
      this.vertical: false,
      this.size: 80,
      this.thickness: 6});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          width: vertical ? thickness : size,
          height: vertical ? size : thickness,
          decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(thickness / 2))),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          width: vertical ? thickness : value * size,
          height: vertical ? value * size : thickness,
          decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(blurRadius: thickness / 2, color: Colors.yellow)
              ],
              borderRadius: vertical
                  ? value < 0.9
                      ? BorderRadius.only(
                          topLeft: Radius.circular(thickness / 2),
                          topRight: Radius.circular(thickness / 2))
                      : BorderRadius.all(Radius.circular(thickness / 2))
                  : value < 0.9
                      ? BorderRadius.only(
                          topLeft: Radius.circular(thickness / 2),
                          bottomLeft: Radius.circular(thickness / 2))
                      : BorderRadius.all(Radius.circular(thickness / 2))),
        ),
      ],
    );
  }
}
