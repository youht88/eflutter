import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import 'package:get/get.dart';

import 'utils/util.dart';
import 'components/comm.dart';

void main() {
  final crypto = Crypto();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

String option(String type) => return '''
    {
      xAxis: {
        type: 'category',
        data: ['周一', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {
        type: 'value'
      },
      series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        smooth:true,
        type: $type
      }]
    }
  ''';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("chart")),
        body: ListView(children: [
          Text("ppp"),
          //Echart.setOption(option1, width: 300, height: 250),
          Echart.setOption(option("line"), width: 300, height: 250),
          SizedBox(height: 8),
          Echart.setOption(option("bar"), width: 300, height: 250),
        ]));
  }
}
