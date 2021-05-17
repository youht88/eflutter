import 'package:eflutter/comm/components/star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'card_controll.dart';
import 'dart:math';

class CardView extends GetView<CardController> {
  @override
  Widget build(BuildContext contenx) {
    Get.put(CardController());
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return ylzCard(
                gradient: LinearGradient(
                    colors: [Colors.pinkAccent, Colors.blueAccent]),
                //color: Colors.deepOrangeAccent,
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Hello",
                        style: TextStyle(fontWeight: FontWeight.bold))));
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.temp.value = "hello",
        child: Icon(Icons.charging_station),
      ),
    );
  }
}

Widget ylzCard(
    {double? width = 100,
    double? height = 50,
    Color? color, //Theme.of(context).cardColor,
    Gradient? gradient,
    int n = 3,
    Widget? child}) {
  List<Widget> circles = List.generate(
      Random().nextInt(n),
      (index) => Container(
          alignment: Alignment(
              Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1),
          child: CustomPaint(
              painter: StarPainter(
                  n: 5,
                  R: Random().nextInt(20).toDouble(),
                  r: Random().nextInt(10).toDouble(),
                  color: Colors.transparent.withAlpha(20))))).toList();

  circles.add(Container(child: child));

  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
      ),
      // child: Stack(children: [
      //   Container(alignment: Alignment(0.23454, 0.5234), child: Text("abc")),
      //   Container(alignment: Alignment(0.72343, 0.323435), child: Text("xyz"))
      // ])
      child: Stack(children: circles));
}
