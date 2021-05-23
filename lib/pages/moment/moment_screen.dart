import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'moment_controller.dart';

class MomentPage extends GetView<MomentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MomentPage')),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                    MomentWidget(),
                  ],
                ))));
  }
}

class MomentWidget extends GetView {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(0.5, 0.5),
                  //     color: Colors.black,
                  //     blurRadius: 3,
                  //   )
                  // ],
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30)),
                  gradient: LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.blueAccent.withOpacity(0.7)
                  ]),
                ),
                height: 100,
                child: Container(
                    child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            CircleAvatar(child: Icon(Icons.food_bank_rounded))),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("西红柿炒蛋",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white)),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("3 hours ago",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white
                                                  .withOpacity(0.8))),
                                    ),
                                  ),
                                ]),
                            //Divider(
                            //  color: Colors.white,
                            //  thickness: 0.5,
                            //),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MetricWidget(
                                      barColor: Colors.red,
                                      value: 200.23,
                                      unit: "千卡",
                                      iconData: FontAwesomeIcons.burn,
                                      type: "热量"),
                                  MetricWidget(
                                      barColor: Colors.purpleAccent,
                                      value: 20.23,
                                      unit: "克",
                                      iconData: FontAwesomeIcons.tree,
                                      type: "蛋白"),
                                  MetricWidget(
                                      barColor: Colors.amberAccent,
                                      value: 122.44,
                                      unit: "克",
                                      iconData: FontAwesomeIcons.water,
                                      type: "脂肪"),
                                  MetricWidget(
                                      barColor: Colors.lightGreenAccent,
                                      value: 0.01,
                                      unit: "克",
                                      iconData: Icons.ac_unit,
                                      type: "碳水"),
                                  MetricWidget(
                                      barColor: Colors.cyanAccent,
                                      value: 12.75,
                                      unit: "毫克",
                                      iconData:
                                          FontAwesomeIcons.solidStickyNote,
                                      type: "钠"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )))),
      ],
    );
  }
}

class MetricWidget extends StatelessWidget {
  final Color barColor;
  final double value;
  final String unit;
  final IconData? iconData;
  final String type;
  const MetricWidget({
    Key? key,
    this.barColor: Colors.white,
    this.value: 123.45,
    this.unit: "千卡",
    this.iconData,
    this.type: "热量",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
