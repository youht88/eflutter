import 'package:eflutter/comm/components/indicateBarWidget/indicateBarWidget_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'metricWidget_controller.dart';

class MetricWidget extends GetView<MetricWidgetController> {
  final Color barColor;
  final double value;
  final double? indicate;
  final String unit;
  final IconData? iconData;
  final String type;
  const MetricWidget({
    Key? key,
    this.barColor: Colors.white,
    this.value: 0.0,
    this.indicate,
    this.unit: "unit",
    this.iconData,
    this.type: "type",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("$value,$indicate,$type");
    return Container(
        //margin: EdgeInsets.all(8),
        height: 35,
        child: value != 0
            ? Row(
                children: [
                  VerticalDivider(
                    thickness: 3,
                    indent: 2,
                    endIndent: 2,
                    color: barColor,
                  ),
                  Column(
                    children: [
                      indicate != null
                          ? Row(children: [
                              IndicateBarWidget(
                                  size: 50,
                                  thickness: 5,
                                  color: Colors.pinkAccent,
                                  value: indicate!),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "$value",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.white)),
                                TextSpan(
                                    text: "$unit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                        color: Colors.white))
                              ])),
                            ])
                          : RichText(
                              text: TextSpan(children: [
                              TextSpan(
                                  text: "$value",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white)),
                              TextSpan(
                                  text: "$unit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                      color: Colors.white))
                            ])),
                      RichText(
                          text: TextSpan(children: [
                        iconData != null
                            ? WidgetSpan(
                                child: Icon(
                                iconData,
                                size: 14,
                                color: barColor,
                              ))
                            : WidgetSpan(child: SizedBox.shrink()),
                        WidgetSpan(child: SizedBox(width: 3)),
                        TextSpan(
                            text: "$type",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white))
                      ]))
                    ],
                  )
                ],
              )
            : SizedBox.shrink());
  }
}
