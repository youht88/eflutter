import 'package:eflutter/comm/components/star.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'card_controll.dart';
import 'dart:math';

class CardView extends GetView<CardController> {
  @override
  Widget build(BuildContext contenx) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [
        ylzCard(
            height: 400,
            width: 200,
            n: 2,
            gradient: LinearGradient(
                stops: [0.001, 0.999], colors: [Colors.pink, Colors.blue]),
            child: Align(alignment: Alignment.center, child: Text("Hello"))),
        SizedBox(width: 20),
        ylzCard(
            height: 400,
            width: 200,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5],
                colors: [Colors.deepOrange, Colors.purple]),
            child: Align(alignment: Alignment.center, child: Text("Flutter"))),
      ]),
    );
  }
}

Widget ylzCard(
    {double? width = 100,
    double? height = 50,
    Color? color, //Theme.of(context).cardColor,
    Gradient? gradient,
    int n = 2,
    Widget? child}) {
  List<Widget> circles = List.generate(
      Random().nextInt(5),
      (index) => Container(
          alignment: Alignment(
              Random().nextDouble() * 2 - 1, Random().nextDouble() * 2 - 1),
          width: Random().nextInt(width!.toInt()).toDouble(),
          height: Random().nextInt(height!.toInt()).toDouble(),
          //height: 600,
          //decoration: BoxDecoration(
          //  color: Colors.white12,
          //  shape: BoxShape.circle,
          //),
          child: CustomPaint(
              painter: StarPainter(
                  n: Random().nextInt(12),
                  R: Random().nextInt(50).toDouble(),
                  r: Random().nextInt(50).toDouble(),
                  color: Colors.white12)))).toList();

  circles.add(Container(child: child));
  final abc = [1, 2, 3].map((item) => Text("$item"));
  print(circles);

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
