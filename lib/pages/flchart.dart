import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/components.dart';

class FlchartController extends GetxController {}

class FlchartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final FlchartController c = Get.put(FlchartController());

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back),
        ),
        title: Text("flchart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            LineChartSample1(),
            SizedBox(height: 8),
            LineChartSample5(),
            SizedBox(height: 8),
            LineChartSample2(),
            SizedBox(height: 8),
            LineChartSample9(),
          ],
        ),
      ),
    );
  }
}
