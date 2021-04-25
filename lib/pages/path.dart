import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../comm/global.dart' as Global;

import '../comm/components/star.dart';

class PathController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class PathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PathController c = Get.put(PathController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back),
        ),
        title: Text("n star"),
      ),
      body: Center(
        child: Container(
            //decoration: BoxDecoration(gradient: Global.mainGradient),
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: CustomPaint(
                    painter: StarPainter(n: 8, color: Colors.purple))),
            Expanded(
              child: CustomPaint(
                  painter: StarPainter(n: 5, color: Colors.deepOrangeAccent)),
            ),
          ],
        )),
      ),
    );
  }
}
