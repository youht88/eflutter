import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flBarChart_controller.dart';

class FlBarChart extends GetView<FlBarChartController> {
  final EdgeInsets padding;
  final Duration swapAnimationDuration;
  final Curve swapAnimationCurve;
  final double? thickness;
  final TextStyle textStyle;
  List<List<double>> data;
  List<List<Color>> colors;
  List<String> titles;
  FlBarChart({
    this.padding: const EdgeInsets.all(20),
    this.swapAnimationDuration: const Duration(milliseconds: 1000),
    this.swapAnimationCurve: Curves.bounceOut,
    this.thickness: 3.0,
    this.textStyle: const TextStyle(fontSize: 12, color: Colors.white),
    required this.data,
    required this.colors,
    required this.titles,
  });
  @override
  Widget build(BuildContext context) {
    assert(data.length == colors.length);
    //如果是一维数组，转换为二维，并确保数据转换到二维中的第一列
    if (data.length == 1) {
      data = data[0].map((x) => [x]).toList();
      colors = colors[0].map((x) => [x]).toList();
    }
    return Container(
      padding: padding,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          backgroundColor: Colors.transparent,
          titlesData: FlTitlesData(
              show: true,
              leftTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                  showTitles: true,
                  rotateAngle: -45,
                  getTextStyles: (_) => textStyle,
                  getTitles: (value) => "${titles[value.toInt()]}")),
          barGroups: data
              .asMap()
              .keys
              .map(
                (idx) => BarChartGroupData(
                  x: idx,
                  barRods: data[idx]
                      .asMap()
                      .keys
                      .map((jdx) => BarChartRodData(
                          width: thickness,
                          y: data[idx][jdx],
                          colors: colors[idx]))
                      .toList(),
                ),
              )
              .toList(),
        ),
        swapAnimationDuration: swapAnimationDuration,
        swapAnimationCurve: swapAnimationCurve,
      ),
    );
  }
}
