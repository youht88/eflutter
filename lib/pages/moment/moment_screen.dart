import 'package:eflutter/comm/components/indicateBarWidget/indicateBarWidget_screen.dart';
import 'package:eflutter/comm/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eflutter/comm/components.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'moment_controller.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class MomentPage extends GetView<MomentController> {
  @override
  Widget build(BuildContext context) {
    MomentController c = Get.put(MomentController());
    ReportWidgetController report = Get.put(ReportWidgetController());
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.refresh3(),
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 600,
                child: GetBuilder<MomentController>(
                    builder: (x) => ListView.builder(
                        itemCount: x.data.length,
                        itemBuilder: (context, index) => AnimatedContainer(
                              duration: 3.seconds,
                              //transformAlignment: Alignment.centerLeft,
                              child: MomentWidget(
                                  leading: x.data[index]["leading"],
                                  leadingColor: x.data[index]["leadingColor"] ??
                                      Colors.black87,
                                  color:
                                      x.data[index]["color"] ?? Colors.black87,
                                  title: x.data[index]["title"] ?? "",
                                  timeStr: x.data[index]["timeStr"] ?? "",
                                  metric: x.data[index]["metric"]),
                            ))),
              ),
              SizedBox(height: 8),
              GetBuilder<MomentController>(
                init: MomentController(),
                initState: (_) {},
                builder: (_) {
                  return Row(children: [
                    Expanded(
                        child: AspectRatio(
                            aspectRatio: 10 / 5,
                            child: GetBuilder<MomentController>(
                              builder: (x) {
                                return ReportWidget(
                                    gradient: LinearGradient(colors: [
                                      Colors.deepOrange,
                                      Colors.purple,
                                      Colors.pink
                                    ]),
                                    flchart: FlBarChart(
                                      thickness: 6,
                                      data: [c.data1],
                                      colors: [c.data1_colors],
                                    ),
                                    title: "平均体重",
                                    subTitle: "2021.03.05",
                                    type: '',
                                    value: MathUtil.stat(x.data1)["avg"]!
                                        .toPrecision(2)
                                        .toString(),
                                    unit: 'Kg');
                              },
                            ))),
                    SizedBox(width: 10),
                    Expanded(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: AspectRatio(
                          aspectRatio: 10 / 5,
                          child: GetBuilder<MomentController>(
                            builder: (x) {
                              return ReportWidget(
                                  alignment: Alignment.bottomRight,
                                  title: "饮食结构",
                                  subTitle: "2021.03.05",
                                  flchart: FlPieChart(
                                    padding: EdgeInsets.all(10),
                                    sectionsSpace: 10,
                                    data: x.data2,
                                    colors: x.data2_colors,
                                    titles: x.data2_titles,
                                  ),
                                  type: '蔬菜类',
                                  value: (x.data2[0] /
                                          MathUtil.stat(x.data2)["sum"]! *
                                          100)
                                      .toPrecision(1)
                                      .toString(),
                                  unit: '%');
                            },
                          )),
                    )),
                  ]);
                },
              ),
              SizedBox(height: 8),
              Container(
                //duration: 4.seconds,
                // transform: Matrix4Transform()
                //     //.scale(0.5)
                //     //.rotateByCenterDegrees(180, Size(350, 350))
                //     //.upRight(35)
                //     //.rotate(pi)
                //     .flipHorizontally(origin: Offset(200, 200))
                //     .matrix4,
                width: 450,
                height: 230,
                child: GetBuilder<MomentController>(
                  //init: MomentController(),
                  //initState: (_) {},
                  builder: (_) {
                    return ReportWidget(
                        gradient: LinearGradient(colors: [
                          Colors.black87,
                          Colors.greenAccent,
                          Colors.yellow.shade700
                        ]),
                        title: "总摄入能量方差",
                        subTitle: "2021.05.25",
                        flchart: FlLineChart(
                            thickness: 1,
                            curved: [true],
                            below: [true],
                            //dot: [true],
                            data: [c.data3],
                            colors: [
                              [Colors.pink, Colors.black54]
                            ],
                            title: "test line chart"),
                        type: '',
                        value: MathUtil.stat(
                          c.data3,
                          extra: true,
                        )["std"]!
                            .toPrecision(2)
                            .toString(),
                        unit: '千卡');
                  },
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: [
                  Container(
                    width: 400,
                    height: 300,
                    child: ReportWidget(
                      alignment: Alignment.topRight,
                      value: "20.00",
                      unit: "Kg",
                      flchart: FlLineChart(
                          thickness: 2,
                          below: [true, false],
                          dot: [false, true],
                          xPoint: 3,
                          yPoint: 3,
                          data: [
                            List.generate(
                                    10, (index) => (index * index).toDouble())
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
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    child: ReportWidget(
                      flchart: FlBarChart(
                          thickness: 15,
                          data: [
                            [1.0, 3.0, 20.0, 7.0, 9.0]
                          ],
                          colors: [
                            [
                              Colors.red,
                              Colors.blue,
                              Colors.purple,
                              Colors.pink,
                              Colors.green
                            ]
                          ],
                          title: "just a barchart"),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    child: ReportWidget(
                      flchart: FlBarChart(
                          thickness: 5,
                          data: [
                            [1.3, 3.0, 5.0, 6.0],
                            [1.0, 2.0, 3.0, 9.0]
                          ],
                          colors: [
                            [Colors.red, Colors.blue],
                            [Colors.deepOrange, Colors.purple]
                          ],
                          title: "just a barchart"),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    child: ReportWidget(
                      gradient: LinearGradient(
                          colors: [Colors.grey, Colors.blueGrey]),
                      flchart: FlPieChart(data: [
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                        Text("South",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                        Text("West",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                        Text("North",
                            style: TextStyle(color: Colors.white, fontSize: 10))
                      ]),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Container(
                child: IndicateBarWidget(
                    color: Colors.blue,
                    size: 200,
                    vertical: false,
                    thickness: 8,
                    value: 0.6),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
