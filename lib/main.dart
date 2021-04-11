import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import 'comm/utils.dart';
import 'comm/components.dart';
import 'routes/route.dart';

main() async {
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: MyRoutes.initialRoute,
    getPages: MyRoutes.routes,
    unknownRoute: MyRoutes.unknowRoute,
  ));
}

String option(String type) => '''
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
      body: WebView(initialUrl: "https://flutterchina.club/"),

      //Echart.setOption(option("line"), width: 300, height: 250),
      //SizedBox(height: 8),
      //Echart.setOption(option("bar"), width: 300, height: 250),
    );
  }
}
