import 'dart:collection';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

class MomentController extends GetxController {
  var data = [];
  var item = [];
  @override
  void onInit() async {
    super.onInit();
    init();
    reset();
    print("onInit");
  }

  void reset() async {
    data = data.sublist(0, 0);
    //data.addAll(item);
    update();
    int i = 0;
    Timer.periodic(2.seconds, (timer) {
      if (i < 5) {
        data.add(item[i]);
        i++;
        update();
      } else {
        timer.cancel();
      }
    });
  }

  void init() {
    item.add({
      "leading": FontAwesomeIcons.nutritionix,
      //"leadingColor": Colors.black87,
      //"color": Colors.black87,
      "title": "西红柿蛋花汤 1 Bowl",
      "timeStr": "3小时前",
      "metric": [
        {
          "barColor": Colors.red,
          "value": 200.23,
          "unit": "千卡",
          "iconData": FontAwesomeIcons.burn,
          "type": "热量"
        },
        {
          "barColor": Colors.purple,
          "value": 19.6,
          "unit": "克",
          "iconData": FontAwesomeIcons.tree,
          "type": "蛋白质"
        },
        {
          "barColor": Colors.brown,
          "value": 44.1,
          "unit": "克",
          "iconData": FontAwesomeIcons.stackOverflow,
          "type": "脂肪"
        },
        {
          "barColor": Colors.deepOrangeAccent,
          "value": 101.45,
          "unit": "克",
          "iconData": FontAwesomeIcons.adversal,
          "type": "碳水化物"
        },
        {
          "barColor": Colors.pink,
          "value": 19.6,
          "unit": "毫克",
          "iconData": FontAwesomeIcons.accusoft,
          "type": "钠"
        },
        {
          "barColor": Colors.yellowAccent,
          "value": 150.0,
          "unit": "毫升",
          "iconData": FontAwesomeIcons.glassWhiskey,
          "type": "水"
        }
      ]
    });
    item.add({
      "leading": FontAwesomeIcons.stepForward,
      "leadingColor": Colors.black87,
      "color": Colors.black,
      "title": "慢走",
      "timeStr": "6小时前",
      "metric": [
        {
          "barColor": Colors.red,
          "value": 120.91,
          "unit": "千卡",
          "iconData": FontAwesomeIcons.burn,
          "type": "热量"
        },
        {
          "barColor": Colors.lightGreenAccent,
          "value": 45.0,
          "unit": "分钟",
          "iconData": FontAwesomeIcons.clock,
          "type": "用时"
        }
      ],
    });

    item.add({
      "leading": FontAwesomeIcons.meetup,
      "leadingColor": Colors.black87,
      "color": Colors.black,
      "title": "看抖音",
      "timeStr": "15分钟前",
      "metric": [
        {
          "barColor": Colors.lightGreenAccent,
          "value": 10.0,
          "unit": "分钟",
          "iconData": FontAwesomeIcons.clock,
          "type": "用时"
        }
      ]
    });

    item.add({
      "leading": FontAwesomeIcons.hospital,
      "leadingColor": Colors.black87,
      "color": Colors.black,
      "title": "血压",
      "timeStr": "刚刚",
      "metric": [
        {
          "barColor": Colors.redAccent,
          "value": 120.0,
          "unit": "毫米汞柱",
          //"iconData": FontAwesomeIcons.clock,
          "type": "收缩压"
        },
        {
          "barColor": Colors.lightGreenAccent,
          "value": 90.0,
          "unit": "毫米汞柱",
          //"iconData": FontAwesomeIcons.clock,
          "type": "舒张压"
        },
      ]
    });

    item.add({
      "leading": FontAwesomeIcons.hospital,
      "leadingColor": Colors.black87,
      "color": Colors.black87,
      "title": "体重",
      "timeStr": "12小时前",
      "metric": [
        {
          "barColor": Colors.redAccent,
          "value": 81.2,
          "unit": "Kg",
          //"iconData": FontAwesomeIcons.clock,
          "type": "体重"
        },
        {
          "barColor": Colors.lightGreenAccent,
          "value": 174.5,
          "unit": "cm",
          //"iconData": FontAwesomeIcons.clock,
          "type": "身高"
        },
        {
          "barColor": Colors.blueAccent,
          "value": 41.15,
          "unit": "",
          //"iconData": FontAwesomeIcons.clock,
          "type": "BMI指数"
        },
        {
          "barColor": Colors.lightBlueAccent,
          "value": 30.0,
          "indicate": 0.3,
          "unit": "%",
          "iconData": FontAwesomeIcons.clock,
          "type": "肥胖程度"
        }
      ]
    });
  }

  Widget flLineChart({
    double width: 150,
    double height: 50,
    List<bool>? below,
    List<bool>? dot,
    double thickness: 3.0,
    required List<List<double>> data,
    required List<List<Color>> colors,
    String? title,
  }) {
    assert(data.length == colors.length);
    assert(below == null || below.length == data.length);
    assert(dot == null || dot.length == data.length);
    if (below == null) {
      below = List.generate(data.length, (index) => false).toList();
    }
    if (dot == null) {
      dot = List.generate(data.length, (index) => false).toList();
    }
    final spots = data
        .map((items) => (items
            .asMap()
            .keys
            .map((idx) => FlSpot(idx.toDouble(), items[idx]))).toList())
        .toList();

    return Container(
      width: width,
      height: height,
      child: LineChart(LineChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
            show: false,
            topTitles:
                SideTitles(showTitles: true, getTitles: (value) => title!)),
        lineBarsData: spots
            .asMap()
            .keys
            .map((idx) => LineChartBarData(
                  colors: colors[idx],
                  spots: spots[idx],
                  isCurved: true,
                  barWidth: thickness,
                  belowBarData: BarAreaData(
                    colors: colors[idx],
                    show: below![idx],
                  ),
                  dotData: FlDotData(show: dot![idx]),
                ))
            .toList(),
      )),
    );
  }

  Widget flBarChart({
    double width: 150,
    double height: 50,
    double thickness: 3.0,
    required List<List<double>> data,
    required List<List<Color>> colors,
    String? title,
  }) {
    assert(data.length == colors.length);
    return Container(
        margin: EdgeInsets.all(8),
        width: width,
        height: height,
        child: BarChart(BarChartData(
            gridData: FlGridData(show: true),
            borderData: FlBorderData(show: false),
            backgroundColor: Colors.transparent,
            titlesData: FlTitlesData(
                show: false,
                topTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) => value == 0 ? title! : "")),
            barGroups: data
                .asMap()
                .keys
                .map((idx) => BarChartGroupData(
                    x: idx,
                    barRods: data[idx]
                        .asMap()
                        .keys
                        .map((jdx) => BarChartRodData(
                            y: data[idx][jdx], colors: colors[idx]))
                        .toList()))
                .toList())));
  }

  Widget flPieChart({
    double width: 150,
    double height: 150,
    double centerSpaceRadius: double.infinity,
    double sectionsSpace: 2,
    required List<double> data,
    required List<Color> colors,
    required List<Widget> titles,
  }) {
    assert(data.length == colors.length && data.length == titles.length);
    return Container(
        margin: EdgeInsets.all(8),
        width: width,
        height: height,
        child: PieChart(PieChartData(
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
                .toList()
            // data
            //     .asMap()
            //     .keys
            //     .map((idx) => BarChartGroupData(
            //         x: idx,
            //         barRods: data[idx]
            //             .asMap()
            //             .keys
            //             .map((jdx) => BarChartRodData(
            //                 y: data[idx][jdx], colors: colors[idx]))
            //             .toList()))
            //     .toList(),
            )));
  }
}
