import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:fl_chart/fl_chart.dart';

class Echart {
  static Widget setOption(option, {double width, double height}) {
    return Container(
      child: Echarts(
        option: option,
      ),
      width: width,
      height: height,
    );
  }
}
