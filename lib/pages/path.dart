import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../comm/global.dart' as Global;

import '../comm/components/star.dart';
import 'package:shimmer/shimmer.dart';

class PathController extends GetxController {}

class PathDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PathController c = Get.put(PathController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
        ),
        title: Text("n star"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
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
           Positioned(
             child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.red,
                  highlightColor: Colors.yellow,
                  child: Text(
                    'Shimmer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),
           )
          ],
        ),
      ),
    );
  }
}
