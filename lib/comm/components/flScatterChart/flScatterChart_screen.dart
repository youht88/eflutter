import 'package:eflutter/comm/utils/mathUtil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flScatterChart_controller.dart';

class FlScatterChart extends GetView<FlScatterChartController> {
  final EdgeInsets padding;
  final Duration swapAnimationDuration;
  final Curve swapAnimationCurve;
  final TextStyle? textStyle;
  List<Map<String, double>> data;
  List<Color> colors;
  String? title;
  FlScatterChart({
    this.padding: const EdgeInsets.all(20),
    this.swapAnimationDuration: const Duration(milliseconds: 1000),
    this.swapAnimationCurve: Curves.bounceOut,
    this.textStyle: const TextStyle(fontSize: 12, color: Colors.white),
    required this.data,
    required this.colors,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    assert(data.length == colors.length);
    FlScatterChartController c = Get.put(FlScatterChartController());

    return Container(
      //width: width,
      //height: height,
      padding: padding,
      child: ScatterChart(
        ScatterChartData(
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
                  interval: 10
                  // getTitles: (value) {
                  //   if (value == 2.2) {
                  //     return "2.2";
                  //   }
                  //   return "";
                  // }
                  )),
          scatterTouchData: ScatterTouchData(enabled: false),
          scatterSpots: data
              .asMap()
              .keys
              .map<ScatterSpot>((idx) => ScatterSpot(
                  data[idx]["x"]!, data[idx]["y"]!,
                  radius: data[idx]["value"], color: colors[idx]))
              .toList(),
        ),
        swapAnimationDuration: swapAnimationDuration,
        swapAnimationCurve: swapAnimationCurve,
      ),
    );
  }
}
