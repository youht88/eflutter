import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reportWidget_controller.dart';

class ReportWidget extends GetView<ReportWidgetController> {
  final Gradient gradient;
  final String title;
  final String subTitle;
  final String type;
  final Widget? flchart;
  final String? value;
  final String? unit;
  final AlignmentGeometry alignment;
  ReportWidget(
      {this.gradient:
          const LinearGradient(colors: [Colors.orange, Colors.green]),
      this.title: "",
      this.subTitle: "",
      this.flchart,
      this.type: "",
      this.value: "",
      this.unit: "",
      this.alignment: Alignment.center});
  @override
  Widget build(BuildContext context) {
    ReportWidgetController c = Get.put(ReportWidgetController());
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [BoxShadow(offset: Offset(0.8, 0.8), blurRadius: 1)],
          gradient: gradient),
      child: Stack(
        children: [
          Obx(() => AnimatedOpacity(
                duration: 1000.milliseconds,
                opacity: c.opacity_chart.value,
                child: flchart,
              )),
          Align(
            alignment: Alignment(-0.9, -0.9),
            child: LayoutBuilder(
                builder: (context, size) => Container(
                      width: size.biggest.width * 0.15,
                      height: size.biggest.height * 0.15,
                      //color: Colors.grey,
                      child: FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$title",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 3),
                            Text("$subTitle",
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    )),
          ),
          GestureDetector(
            onTap: () => c.change(),
            child: Obx(() => AnimatedOpacity(
                opacity: c.opacity_metric.value,
                duration: 1000.milliseconds,
                child: Align(
                  alignment: alignment,
                  child: LayoutBuilder(
                    builder: (context, size) => Container(
                      width: size.biggest.width * 0.5,
                      height: size.biggest.height * 0.5,
                      //color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Column(
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("$value",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold)),
                                    Text("$unit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                              Text("$type",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      letterSpacing: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))),
          ),
        ],
      ),
    );
  }
}
