import 'package:eflutter/comm/utils.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

class MomentController extends GetxController {
  //var opacity = 1.0.obs;
  //var simple = true.obs;
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
    data2 = MathUtil.randomDouble(50.0, 300.0, 5);
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
}
