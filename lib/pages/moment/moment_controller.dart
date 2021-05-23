import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MomentController extends GetxController {
  var data = [];
  @override
  void onInit() async {
    super.onInit();
    reset();
    print("onInit");
  }

  void reset() async {
    data = data.sublist(0, 0);
    await Future.delayed(1.seconds, () {
      data.add(item1);
      update();
    });
    await Future.delayed(1.seconds, () {
      data.add(item2);
      update();
    });
    await Future.delayed(3.seconds, () {
      data.add(item3);
      update();
    });
    await Future.delayed(1.seconds, () {
      data.add(item4);
      update();
    });
    await Future.delayed(3.seconds, () {
      data.add(item5);
      update();
    });
  }
}

dynamic item1 = {
  "leading": FontAwesomeIcons.nutritionix,
  "leadingColor": Colors.grey,
  "color": Colors.blue,
  "title": "西红柿蛋花汤1",
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
};

final item2 = {
  "leading": FontAwesomeIcons.stepForward,
  "leadingColor": Colors.grey,
  "color": Colors.deepOrangeAccent,
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
};

final item3 = {
  "leading": FontAwesomeIcons.meetup,
  "leadingColor": Colors.grey,
  "color": Colors.grey,
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
};

final item4 = {
  "leading": FontAwesomeIcons.hospital,
  "leadingColor": Colors.purple,
  "color": Colors.purple,
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
};

final item5 = {
  "leading": FontAwesomeIcons.hospital,
  "leadingColor": Colors.purple,
  "color": Colors.purple,
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
      "barColor": Colors.lightGreenAccent,
      "value": 30.0,
      "indicate": 0.3,
      "unit": "%",
      //"iconData": FontAwesomeIcons.clock,
      "type": "肥胖程度"
    }
  ]
};
