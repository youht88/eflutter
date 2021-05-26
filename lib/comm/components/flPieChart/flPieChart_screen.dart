import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flPieChart_controller.dart';

class FlPieChart extends GetView<FlPieChartController> {
  final EdgeInsets padding;
  final Duration swapAnimationDuration;
  final Curve swapAnimationCurve;
  double centerSpaceRadius;
  double sectionsSpace;
  List<double> data;
  List<Color> colors;
  List<Widget> titles;
  FlPieChart({
    this.padding: const EdgeInsets.all(20),
    this.swapAnimationDuration: const Duration(milliseconds: 1000),
    this.swapAnimationCurve: Curves.bounceOut,
    this.centerSpaceRadius: double.infinity,
    this.sectionsSpace: 2,
    required this.data,
    required this.colors,
    required this.titles,
  });
  @override
  Widget build(BuildContext context) {
    assert(data.length == colors.length && data.length == titles.length);
    return Container(
        padding: padding,
        child: PieChart(
            PieChartData(
                centerSpaceRadius: centerSpaceRadius,
                borderData: FlBorderData(show: false),
                sectionsSpace: sectionsSpace,
                sections: data
                    .asMap()
                    .keys
                    .map(
                      (idx) => PieChartSectionData(
                          value: data[idx],
                          color: colors[idx],
                          radius: 40,
                          showTitle: false,
                          badgeWidget: titles[idx],
                          badgePositionPercentageOffset: 0.5),
                    )
                    .toList()),
            swapAnimationCurve: swapAnimationCurve,
            swapAnimationDuration: swapAnimationDuration));
  }
}
