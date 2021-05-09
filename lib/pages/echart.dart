import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/components.dart';

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

class EchartController extends GetxController {}

class EchartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final EchartController c = Get.put(EchartController());

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("echart"),
        ),
        body: GetPlatform.isWeb
            ? null
            : Column(children: [
                Echart.setOption(option("line"), width: 300, height: 250),
                SizedBox(height: 8),
                Echart.setOption(option("bar"), width: 300, height: 250),
              ]));
  }
}
