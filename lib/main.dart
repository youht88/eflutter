import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:get/get.dart';
import 'package:cryptography/cryptography.dart';

void main() {
  final request = runApp(MyApp());
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

class MyHomePage extends StatelessWidget {
  Widget getChart(String type) => Container(
        child: Echarts(
          option: '''
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
        type: '$type'
      }]
    }
  ''',
        ),
        width: 500,
        height: 250,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("chart")),
        body: ListView(children: [
          getChart("bar"),
          getChart("line"),
          getChart("pie"),
        ]));
  }
}
