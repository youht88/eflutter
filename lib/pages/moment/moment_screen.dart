import 'package:eflutter/comm/components/indicateBarWidget/indicateBarWidget_screen.dart';
import 'package:eflutter/comm/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eflutter/comm/components.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'moment_controller.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
          onPressed: () => c.addSize(), child: Icon(Icons.plus_one)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // CircularPercentIndicator(
              //   radius: 50.0,
              //   lineWidth: 6.0,
              //   percent: 0.30,
              //   center: new Text("30%", style: TextStyle(color: Colors.blue)),
              //   circularStrokeCap: CircularStrokeCap.round,
              //   animation: true,
              //   //progressColor: Colors.red,
              // ),
              // Obx(() => Container(
              //     width: 50 + c.size.value,
              //     height: 50 + c.size.value,
              //     color: Colors.lightBlue,
              //     child: Row(
              //       children: [
              //         Expanded(flex: 2, child: FittedBox(child: Text("aaa"))),
              //         Expanded(flex: 3, child: SizedBox.shrink()),
              //         Expanded(child: FittedBox(child: Text("bbb")))
              //       ],
              //     ))),
              Container(
                height: 600,
                child: GetBuilder<MomentController>(
                    builder: (x) => ListView.builder(
                        itemCount: x.data.length,
                        itemBuilder: (context, index) => AnimatedContainer(
                              duration: 3.seconds,
                              //transformAlignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  print("abc");
                                  Get.bottomSheet(
                                      Container(height: 200, color: Colors.red),
                                      backgroundColor: Colors.blue);
                                },
                                child: MomentWidget(
                                    leading: x.data[index]["leading"],
                                    leadingColor: x.data[index]
                                            ["leadingColor"] ??
                                        Colors.black87,
                                    colors: x.data[index]["colors"] ??
                                        [Colors.black87],
                                    title: x.data[index]["title"] ?? "",
                                    timeStr: x.data[index]["timeStr"] ?? "",
                                    metric: x.data[index]["metric"]),
                              ),
                            ))),
              ),
              Container(
                height: 100,
                width: 300,
                color: Colors.grey,
                child: FittedWidget(
                  child: Text("hello"),
                  //alignment: Alignment(0, 0),
                  //widthFactor: 0.6,
                  //heightFactor: 0.6,
                ),
              ),
              Container(
                height: 50,
                width: 200,
                color: Colors.grey,
                child: FittedWidget(
                  child: Text("hello"),
                  //alignment: Alignment(0, 0),
                  //widthFactor: 0.5,
                  //heightFactor: 0.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FittedWidget extends StatelessWidget {
  final Widget? child;
  final AlignmentGeometry alignment;
  final double widthFactor;
  final double heightFactor;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const FittedWidget({
    Key? key,
    this.child,
    this.alignment: const Alignment(0.0, 0.0),
    this.widthFactor: 0.5,
    this.heightFactor: 0.5,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(widthFactor);
    return Align(
      alignment: alignment,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints size) {
          return Container(
              constraints: BoxConstraints(
                minWidth: minWidth ?? 0,
                maxWidth: maxWidth ?? double.infinity,
                minHeight: minHeight ?? 0,
                maxHeight: maxHeight ?? double.infinity,
              ),
              width: size.biggest.width * widthFactor,
              height: size.biggest.height * heightFactor,
              //color: Colors.grey.shade400,
              child: FittedBox(child: child, alignment: Alignment.topLeft));
        },
      ),
    );
  }
}

class MomentWidget extends GetView {
  final IconData? leading;
  final Color leadingColor;
  final List<Color> colors;
  final String title;
  final String timeStr;
  final List<Map<String, dynamic>>? metric;
  MomentWidget(
      {Key? key,
      this.leading,
      this.leadingColor: Colors.black87,
      this.colors: const [Colors.black87],
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
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      color: Colors.grey,
                      blurRadius: 5,
                    )
                  ],
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30)),
                  gradient: (colors.length == 1)
                      ? LinearGradient(
                          colors: [colors[0], colors[0].withOpacity(0.7)])
                      : LinearGradient(colors: colors),
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
