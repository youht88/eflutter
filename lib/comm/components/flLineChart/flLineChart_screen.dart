import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'flLineChart_controller.dart';
import 'package:eflutter/comm/utils.dart';

class FlLineChart extends GetView<FlLineChartController> {
  final EdgeInsets padding;
  final Duration swapAnimationDuration;
  final Curve swapAnimationCurve;
  List<bool>? curved;
  List<bool>? below;
  List<bool>? dot;
  double thickness;
  int xPoint;
  int yPoint;
  TextStyle? textStyle;
  bool? showAvgLine;
  List<List<double>> data;
  List<List<Color>> colors;
  String? title;
  FlLineChart({
    this.padding: const EdgeInsets.all(20),
    this.swapAnimationDuration: const Duration(milliseconds: 1000),
    this.swapAnimationCurve: Curves.bounceOut,
    this.curved,
    this.below,
    this.dot,
    this.thickness: 3.0,
    this.xPoint: 5,
    this.yPoint: 4,
    this.showAvgLine: true,
    this.textStyle: const TextStyle(fontSize: 12, color: Colors.white),
    required this.data,
    required this.colors,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    assert(data.length == colors.length);
    assert(curved == null || curved!.length == data.length);
    assert(below == null || below!.length == data.length);
    assert(dot == null || dot!.length == data.length);
    FlLineChartController c = Get.put(FlLineChartController());
    if (curved == null) {
      curved = List.generate(data.length, (index) => false).toList();
    }
    if (below == null) {
      below = List.generate(data.length, (index) => false).toList();
    }
    if (dot == null) {
      dot = List.generate(data.length, (index) => false).toList();
    }
    Map<String, double> stat = MathUtil.stat(data[0], extra: true);
    final spots = data
        .map((items) => (items
            .asMap()
            .keys
            .map((idx) => FlSpot(idx.toDouble(), items[idx]))).toList())
        .toList();

    return Container(
      //width: width,
      //height: height,
      padding: padding,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          axisTitleData: FlAxisTitleData(
              show: true,
              topTitle: AxisTitle(
                showTitle: true,
                titleText: "$title",
                textStyle: textStyle,
              )),
          titlesData: FlTitlesData(
              show: true,
              leftTitles: SideTitles(showTitles: false),
              rightTitles: SideTitles(
                getTextStyles: (_) => textStyle!,
                showTitles: false,
                //interval: 100
                // getTitles: (value) {
                //   if (value.round() == stat["avg"]!.round()) {
                //     return (stat["avg"]! / 10).toStringAsFixed(0) + "0";
                //   }
                //   return "";
                // }
              ),
              bottomTitles: SideTitles(
                  getTextStyles: (_) => textStyle!,
                  showTitles: true,
                  interval: stat["count"]! / xPoint
                  // getTitles: (value) {
                  //   if (value == 2.2) {
                  //     return "2.2";
                  //   }
                  //   return "";
                  // }
                  )),
          //导致android崩溃的原因
          //rangeAnnotations: RangeAnnotations(
          //   horizontalRangeAnnotations: [
          //     HorizontalRangeAnnotation(
          //         y1: stat["avg"]! * 1.05,
          //         y2: stat["avg"]! * 0.95,
          //         color: Colors.red)
          //   ],
          //),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                  y: stat["avg"]!,
                  dashArray: [5, 10, 5],
                  color: Colors.redAccent,
                  label: HorizontalLineLabel(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      style: TextStyle(color: Colors.white),
                      show: true,
                      labelResolver: (_) =>
                          "均值:${stat['avg']!.toPrecision(2)}")),
            ],
            extraLinesOnTop: true,
          ),
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: spots
              .asMap()
              .keys
              .map((idx) => LineChartBarData(
                    colors: colors[idx],
                    spots: spots[idx],
                    isCurved: curved![idx],
                    barWidth: thickness,
                    belowBarData: BarAreaData(
                      colors: colors[idx],
                      show: below![idx],
                    ),
                    dotData: FlDotData(show: dot![idx]),
                  ))
              .toList(),
        ),
        swapAnimationDuration: swapAnimationDuration,
        swapAnimationCurve: swapAnimationCurve,
      ),
    );
  }
}
