import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'moment_controller.dart';

class MomentPage extends GetView<MomentController> {
  @override
  Widget build(BuildContext context) {
    MomentController c = Get.put(MomentController());
    return Scaffold(
      appBar: AppBar(title: Text('MomentPage'), actions: [
        GestureDetector(
          onTap: () {
            c.reset();
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.refresh)),
        )
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              LimitedBox(
                maxWidth: 400,
                maxHeight: 600,
                child: GetBuilder<MomentController>(
                    builder: (c) => ListView.builder(
                        itemCount: c.data.length,
                        itemBuilder: (context, index) => AnimatedContainer(
                              duration: 3.seconds,
                              //transformAlignment: Alignment.centerLeft,
                              child: MomentWidget(
                                  leading: c.data[index]["leading"],
                                  leadingColor: c.data[index]["leadingColor"] ??
                                      Colors.black87,
                                  color:
                                      c.data[index]["color"] ?? Colors.black87,
                                  title: c.data[index]["title"] ?? "",
                                  timeStr: c.data[index]["timeStr"] ?? "",
                                  metric: c.data[index]["metric"]),
                            ))),
              ),
              SizedBox(height: 20),
              c.flLineChart(
                  width: 250,
                  height: 60,
                  thickness: 2,
                  below: [true, false],
                  dot: [false, true],
                  data: [
                    [1, 4, 9, 16, 25, 36, 49, 64, 81],
                    [1, 10, 2, 9, 67, 4, 87, 23, 44]
                  ],
                  colors: [
                    [Colors.red, Colors.blue],
                    [Colors.deepOrange, Colors.purple]
                  ],
                  title: "just a linechart"),
              // c.flBarChart(
              //     width: 200,
              //     height: 80,
              //     data: [
              //       [1, 3, 5, 6],
              //       [1, 2, 3, 4]
              //     ],
              //     colors: [
              //       [Colors.red, Colors.blue],
              //       [Colors.deepOrange, Colors.purple]
              //     ],
              //     title: "just a barchart"),
              SizedBox(height: 20),
              indicatedBar(
                  color: Colors.blue,
                  size: 200,
                  vertical: false,
                  thickness: 8,
                  value: 0.60)
            ],
          ),
        ),
      ),
    );
  }
}

Widget indicatedBar(
        {Color color: Colors.red,
        required double value,
        bool vertical: false,
        double size: 80,
        double thickness: 6}) =>
    Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          width: vertical ? thickness : size,
          height: vertical ? size : thickness,
          decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(thickness / 2))),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          width: vertical ? thickness : value * size,
          height: vertical ? value * size : thickness,
          decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(blurRadius: thickness / 2, color: Colors.yellow)
              ],
              borderRadius: vertical
                  ? value < 0.9
                      ? BorderRadius.only(
                          topLeft: Radius.circular(thickness / 2),
                          topRight: Radius.circular(thickness / 2))
                      : BorderRadius.all(Radius.circular(thickness / 2))
                  : value < 0.9
                      ? BorderRadius.only(
                          topLeft: Radius.circular(thickness / 2),
                          bottomLeft: Radius.circular(thickness / 2))
                      : BorderRadius.all(Radius.circular(thickness / 2))),
        ),
      ],
    );

class MomentWidget extends GetView {
  final IconData? leading;
  final Color leadingColor;
  final Color color;
  final String title;
  final String timeStr;
  final List<Map<String, dynamic>>? metric;
  MomentWidget(
      {Key? key,
      this.leading,
      this.leadingColor: Colors.black87,
      this.color: Colors.black87,
      this.title: "",
      this.timeStr: "",
      this.metric});
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
                  gradient:
                      LinearGradient(colors: [color, color.withOpacity(0.7)]),
                  //LinearGradient(
                  //    colors: [Color(0xff23b6e6), Color(0xff02d39a)]),
                ),
                height: 100,
                child: Container(
                    child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            child: Icon(leading, color: leadingColor))),
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
                                  Text("$title",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.white)),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("$timeStr",
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
                                child: Container(
                                  width: 300,
                                  height: 40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: metric!.length,
                                    itemBuilder: (context, index) =>
                                        MetricWidget(
                                            barColor: metric![index]
                                                    ["barColor"] ??
                                                Colors.lightGreenAccent,
                                            value:
                                                metric![index]["value"] ?? 0.0,
                                            indicate: metric![index]
                                                ["indicate"],
                                            unit: metric![index]["unit"] ?? "",
                                            iconData: metric![index]
                                                ["iconData"],
                                            type:
                                                metric![index]["type"] ?? "未知"),
                                  ),
                                ))
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
  final double? indicate;
  final String unit;
  final IconData? iconData;
  final String type;
  const MetricWidget({
    Key? key,
    this.barColor: Colors.white,
    this.value: 0.0,
    this.indicate,
    this.unit: "千卡",
    this.iconData,
    this.type: "热量",
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
                              indicatedBar(
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
