import 'package:eflutter/comm/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

class MomentController extends GetxController {
  var opacity = 1.0.obs;
  var simple = true.obs;
  var data = [];
  List<double> data1 = [81.4, 81.1, 81.3];
  List<Color> data1_colors = [Colors.blue, Colors.yellow, Colors.brown];
  List<double> data2 = [50.77, 80.79, 120.22, 40.45, 30.56];
  List<Color> data2_colors = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown
  ];
  List<Widget> data2_titles = ["蔬菜类", "肉蛋类", "谷物类", "饮品", "水果类"]
      .map((item) =>
          Text(item, style: TextStyle(fontSize: 8, color: Colors.white)))
      .toList();
  List<double> data3 = [100, 200, 300, 400, 500];
  var item = [];
  @override
  void onInit() async {
    super.onInit();
    init();
    reset();
    print("onInit");
  }

  void refresh3() {
    var random = Random();
    data1 = MathUtil.randomDouble(60.0, 90.0, 3);
    data2 = MathUtil.randomDouble(50, 300, 5);
    data3 = [
      random.nextDouble() * 100,
      random.nextDouble() * 200,
      random.nextDouble() * 300,
      random.nextDouble() * 400,
      random.nextDouble() * 500
    ];
    //print(data3);
    update();
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
    EdgeInsets padding: const EdgeInsets.all(20),
    Duration swapAnimationDuration: const Duration(milliseconds: 1000),
    Curve swapAnimationCurve: Curves.bounceOut,
    List<bool>? curved,
    List<bool>? below,
    List<bool>? dot,
    double thickness: 3.0,
    required List<List<double>> data,
    required List<List<Color>> colors,
    String? title,
    required MomentController c,
  }) {
    assert(data.length == colors.length);
    assert(curved == null || curved.length == data.length);
    assert(below == null || below.length == data.length);
    assert(dot == null || dot.length == data.length);
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
          titlesData: FlTitlesData(
              show: c.simple.value ? false : true,
              topTitles:
                  SideTitles(showTitles: true, getTitles: (value) => "")),
          rangeAnnotations: RangeAnnotations(
            horizontalRangeAnnotations: [
              HorizontalRangeAnnotation(
                  y1: stat["avg"]!, y2: stat["std"]!, color: Colors.red)
            ],
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                  y: stat["avg"]!,
                  label: HorizontalLineLabel(
                      style: TextStyle(color: Colors.white),
                      show: true,
                      labelResolver: (_) => "avg")),
              HorizontalLine(
                  y: stat["std"]!,
                  label: HorizontalLineLabel(
                      style: TextStyle(color: Colors.white),
                      show: true,
                      labelResolver: (_) => "std"))
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

  Widget flBarChart({
    EdgeInsets padding: const EdgeInsets.all(20),
    Duration swapAnimationDuration: const Duration(milliseconds: 1000),
    Curve swapAnimationCurve: Curves.bounceOut,
    double thickness: 3.0,
    required List data,
    required List colors,
    String? title,
  }) {
    late List<List<double>> newData;
    late List<List<Color>> newColors;
    assert(data.length == colors.length);
    //由于传过来的List是dynamic,如果是int需要先转为double，flchart才接受
    if (data[0].runtimeType == int) {
      data = data.map((x) => x.toDouble()).toList();
    }
    //如果是一维数组，转换为二维，并确保数据转换到二维中的第一列
    if (data[0].runtimeType == double) {
      newData = data.map((x) => [x as double]).toList();
      newColors = colors.map((x) => [x as Color]).toList();
    } else {
      newData = data.map((x) => x as List<double>).toList();
      newColors = colors.map((x) => x as List<Color>).toList();
    }
    return Container(
      padding: padding,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          backgroundColor: Colors.transparent,
          titlesData: FlTitlesData(
              show: false,
              topTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) => value == 0 ? title! : "")),
          barGroups: newData
              .asMap()
              .keys
              .map(
                (idx) => BarChartGroupData(
                  x: idx,
                  barRods: newData[idx]
                      .asMap()
                      .keys
                      .map((jdx) => BarChartRodData(
                          width: thickness,
                          y: newData[idx][jdx],
                          colors: newColors[idx]))
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

  Widget flPieChart(
      {EdgeInsets padding: const EdgeInsets.all(20),
      Duration swapAnimationDuration: const Duration(milliseconds: 1000),
      Curve swapAnimationCurve: Curves.bounceOut,
      double centerSpaceRadius: double.infinity,
      double sectionsSpace: 2,
      required List<double> data,
      required List<Color> colors,
      required List<Widget> titles,
      required MomentController c}) {
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
                          badgeWidget: c.simple.value ? null : titles[idx],
                          badgePositionPercentageOffset: 0.5),
                    )
                    .toList()),
            swapAnimationCurve: swapAnimationCurve,
            swapAnimationDuration: swapAnimationDuration));
  }
}
