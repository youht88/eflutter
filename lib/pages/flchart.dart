import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/components.dart';
import '../comm/utils.dart';

class FlchartController extends GetxController {
  List<double> data1 = [81.4, 81.1, 81.3];
  List<Color> data1_colors = [Colors.blue, Colors.yellow, Colors.brown];
  List<String> data1_titles = ["早上", "中午", "晚上"];
  List<double> data2 = [50.77, 80.79, 120.22, 40.45, 30.56];
  List<Color> data2_colors = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.brown
  ];
  List<Widget> data2_titles = ["蔬菜类", "肉蛋类", "谷物类", "饮品", "水果类"]
      .map((item) =>
          Text(item, style: TextStyle(fontSize: 8, color: Colors.white)))
      .toList();
  List<double> data3 = MathUtil.randomDouble(100, 500, 5);
  void refresh3() {
    data1 = MathUtil.randomDouble(60.0, 90.0, 3);
    data2 = MathUtil.randomDouble(50.0, 300.0, 5);
    data3 = MathUtil.randomDouble(100, 500, 5);
    //print(data3);
    update();
  }
}

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.refresh3(),
        child: Icon(Icons.refresh),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 10,
            children: [
              GetBuilder<FlchartController>(
                init: FlchartController(),
                initState: (_) {},
                builder: (_) {
                  return Row(children: [
                    Expanded(
                        child: AspectRatio(
                            aspectRatio: 10 / 5,
                            child: GetBuilder<FlchartController>(
                              builder: (x) {
                                return ReportWidget(
                                    gradient: LinearGradient(colors: [
                                      Colors.deepOrange,
                                      Colors.purple,
                                      Colors.pink
                                    ]),
                                    flchart: FlBarChart(
                                        thickness: 25,
                                        data: [c.data1],
                                        colors: [c.data1_colors],
                                        titles: c.data1_titles),
                                    title: "体重情况",
                                    subTitle: "2021.03.05",
                                    type: '平均体重',
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
                          child: GetBuilder<FlchartController>(
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
                child: GetBuilder<FlchartController>(
                  //init: MomentController(),
                  //initState: (_) {},
                  builder: (_) {
                    return ReportWidget(
                        gradient: LinearGradient(colors: [
                          Colors.black87,
                          Colors.greenAccent,
                          Colors.yellow.shade700
                        ]),
                        title: "总摄入能量",
                        subTitle: "2021.05.25",
                        flchart: FlLineChart(
                            thickness: 3,
                            curved: [true],
                            below: [true],
                            //dot: [true],
                            data: [c.data3],
                            xPoint: 3,
                            yPoint: 5,
                            colors: [
                              [Colors.pink, Colors.black54]
                            ],
                            title: ""),
                        type: '摄入总能量',
                        value: MathUtil.stat(
                          c.data3,
                          extra: true,
                        )["sum"]!
                            .toPrecision(2)
                            .toString(),
                        unit: '千卡');
                  },
                ),
              ),
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
                        List.generate(10, (index) => (index * index).toDouble())
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
                  flchart: FlBarChart(thickness: 15, data: [
                    [1.0, 3.0, 20.0, 7.0, 9.0]
                  ], colors: [
                    [
                      Colors.red,
                      Colors.blue,
                      Colors.purple,
                      Colors.pink,
                      Colors.green
                    ]
                  ], titles: [
                    "one",
                    "two",
                    "three",
                    "four",
                    "five"
                  ]),
                ),
              ),
              Container(
                width: 200,
                height: 150,
                child: ReportWidget(
                  flchart: FlBarChart(thickness: 10, data: [
                    [1.3, 3.0, 5.0, 6.0],
                    [1.0, 2.0, 3.0, 9.0]
                  ], colors: [
                    [Colors.red, Colors.blue],
                    [Colors.deepOrange, Colors.purple]
                  ], titles: [
                    "中国",
                    "美国",
                  ]),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                child: ReportWidget(
                  gradient:
                      LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
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
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("South",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("West",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("North",
                        style: TextStyle(color: Colors.white, fontSize: 10))
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
