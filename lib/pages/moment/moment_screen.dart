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
            child: Icon(Icons.refresh)),
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Container(
            width: 400,
            height: 2000,
            child: GetBuilder<MomentController>(
                builder: (c) => ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => AnimatedContainer(
                          duration: 3.seconds,
                          transformAlignment: Alignment.centerLeft,
                          child: MomentWidget(
                              leading: controller.data[index]["leading"],
                              leadingColor: controller.data[index]
                                  ["leadingColor"],
                              color: controller.data[index]["color"],
                              title: controller.data[index]["title"],
                              timeStr: controller.data[index]["timeStr"],
                              metric: controller.data[index]["metric"]),
                        ))),
          ),
        ),
      ),
    );
  }
}

class MomentWidget extends GetView {
  final IconData? leading;
  final Color? leadingColor;
  final Color? color;
  final String? title;
  final String? timeStr;
  final List<Map<String, dynamic>>? metric;
  MomentWidget(
      {Key? key,
      this.leading,
      this.leadingColor,
      this.color,
      this.title,
      this.timeStr,
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
                      LinearGradient(colors: [color!, color!.withOpacity(0.7)]),
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
                                  width: 600,
                                  height: 40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: metric!.length,
                                    itemBuilder: (context, index) =>
                                        MetricWidget(
                                            barColor: metric![index]
                                                ["barColor"],
                                            value: metric![index]["value"],
                                            unit: metric![index]["unit"],
                                            iconData: metric![index]
                                                ["iconData"],
                                            type: metric![index]["type"]),
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
