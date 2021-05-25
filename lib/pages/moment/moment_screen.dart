import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:math';
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
              Container(
                height: 600,
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
              SizedBox(height: 8),
              Row(children: [
                Expanded(
                    child: AspectRatio(
                        aspectRatio: 10 / 5,
                        child: ReportWidget(
                            gradient: LinearGradient(colors: [
                              Colors.deepOrange,
                              Colors.purple,
                              Colors.pink
                            ]),
                            title: "平均体重",
                            subTitle: "2021.03.05",
                            type: '',
                            value: 81.5,
                            unit: 'Kg'))),
                SizedBox(width: 10),
                Expanded(
                    child: AspectRatio(
                        aspectRatio: 10 / 5,
                        child: ReportWidget(
                            title: "身高",
                            subTitle: "2021.03.05",
                            type: '',
                            value: 174,
                            unit: 'Cm'))),
              ]),
              SizedBox(height: 8),
              Container(
                width: 450,
                height: 230,
                child: ReportWidget(
                    gradient: LinearGradient(colors: [
                      Colors.black87,
                      Colors.greenAccent,
                      Colors.yellow.shade700
                    ]),
                    title: "总摄入能量",
                    subTitle: "2021.05.25",
                    type: '',
                    value: 3415.27,
                    unit: '千卡'),
              ),
              Wrap(
                spacing: 20,
                children: [
                  Container(
                    width: 400,
                    height: 300,
                    child: c.flLineChart(
                        thickness: 2,
                        below: [true, false],
                        dot: [false, true],
                        data: [
                          List.generate(
                                  10000, (index) => (index * index).toDouble())
                              .toList(),
                          //1, 4, 9, 16, 25, 36, 49, 64, 81],
                          [1, 10, 2, 9, 67, 4, 87, 23, 44]
                        ],
                        colors: [
                          [Colors.red, Colors.blue],
                          [Colors.deepOrange, Colors.purple]
                        ],
                        title: "just a linechart"),
                  ),
                  c.flBarChart(
                      width: 300,
                      height: 150,
                      //thickness: 5,
                      data: [
                        [1],
                        [3],
                        [5],
                        [7],
                        [9]
                      ],
                      colors: [
                        [Colors.red],
                        [Colors.blue],
                        [Colors.purple],
                        [Colors.pink],
                        [Colors.green]
                      ],
                      title: "just a barchart"),
                  c.flBarChart(
                      width: 200,
                      height: 200,
                      thickness: 5,
                      data: [
                        [1, 3, 5, 6],
                        [1, 2, 3, 9]
                      ],
                      colors: [
                        [Colors.red, Colors.blue],
                        [Colors.deepOrange, Colors.purple]
                      ],
                      title: "just a barchart"),
                  c.flPieChart(width: 150, height: 150, data: [
                    10,
                    20,
                    30,
                    40
                  ], colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.purple
                  ], titles: [
                    Text("East",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("South",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("West",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("North",
                        style: TextStyle(color: Colors.white, fontSize: 10))
                  ])
                ],
              ),
              SizedBox(height: 8),
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
                                child: LayoutBuilder(
                                    builder: (context, size) => Container(
                                          width: Get.width * 0.7,
                                          height: 40,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: metric!.length,
                                            itemBuilder: (context, index) =>
                                                MetricWidget(
                                                    barColor: metric![index]
                                                            ["barColor"] ??
                                                        Colors.lightGreenAccent,
                                                    value: metric![index]
                                                            ["value"] ??
                                                        0.0,
                                                    indicate: metric![index]
                                                        ["indicate"],
                                                    unit: metric![index]
                                                            ["unit"] ??
                                                        "",
                                                    iconData: metric![index]
                                                        ["iconData"],
                                                    type: metric![index]
                                                            ["type"] ??
                                                        "未知"),
                                          ),
                                        )))
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

class ReportWidget extends StatelessWidget {
  Gradient? gradient;
  String? title;
  String? subTitle;
  String? type;
  double? value;
  String? unit;
  ReportWidget(
      {this.gradient:
          const LinearGradient(colors: [Colors.orange, Colors.green]),
      this.title: "",
      this.subTitle: "",
      this.type: "",
      this.value: 0.0,
      this.unit: ""});
  @override
  Widget build(BuildContext context) {
    MomentController c = Get.put(MomentController());
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [BoxShadow(offset: Offset(0.8, 0.8), blurRadius: 10)],
          gradient: gradient),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: c.flLineChart(
                thickness: 2,
                curved: [true],
                below: [true],
                //dot: [true],
                data: [
                  //1, 4, 9, 16, 25, 36, 49, 64, 81],
                  [81.3, 81.5, 81.4, 81.3, 81.6, 81.5, 81.2, 81.2, 81.5]
                ],
                colors: [
                  [Colors.lightBlueAccent],
                  //[Colors.deepOrange, Colors.purple]
                ],
                title: "just a linechart"),
          ),
          Align(
              alignment: Alignment(-0.8, -0.9),
              child: Column(
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
              )),
          Align(
            alignment: Alignment(0, 0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "$type",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "$value",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "$unit",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ])),
          ),
        ],
      ),
    );
  }
}
