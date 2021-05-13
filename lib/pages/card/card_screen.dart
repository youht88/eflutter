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
            width: 200,
            height: 200,
            n: 4,
            gradient: LinearGradient(colors: [Colors.black, Colors.yellow])),
        ylzCard(
          width: 200,
          height: 200,
          color: Colors.pinkAccent,
        )
      ]),
    );
  }
}

Widget ylzCard(
    {double? width = 100,
    double? height = 50,
    Color? color, //Theme.of(context).cardColor,
    Gradient? gradient,
    int n = 3}) {
  List<Widget> circles = List.generate(
      n,
      (index) => Positioned(
          left: Random().nextInt(1000).toDouble(),
          top: Random().nextInt(1000).toDouble(),
          width: Random().nextInt(1000).toDouble(),
          child: Container(
              //height: 600,
              decoration: BoxDecoration(
            color: Colors.white12,
            shape: BoxShape.circle,
          )))).toList();
  List<Widget> c = List.generate(
      n,
      (index) => Container(
          width: Random().nextInt(1000).toDouble(),
          //height: 600,
          decoration: BoxDecoration(
            color: Colors.white12,
            shape: BoxShape.circle,
          )));
  List<Widget> k = c
      .map((i) => Positioned(
          left: Random().nextInt(1000).toDouble(),
          top: Random().nextInt(1000).toDouble(),
          child: i))
      .toList();
  print(c);
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
      ),
      child: Stack(children: circles));
}
