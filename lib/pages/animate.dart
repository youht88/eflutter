import 'package:eflutter/comm/components.dart';
import 'package:eflutter/comm/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  Future<Widget> test() async {
    await Future.delayed(Duration(seconds: 5));
    return Chip(
      avatar: Icon(Icons.menu),
      label: Text("login"),
      deleteIcon: Icon(Icons.cancel),
      deleteIconColor: Colors.red,
      elevation: 10,
    );
  }

  Future<Widget> table2() async {
    await Future.delayed(Duration(seconds: 5));
    return ylzDataTable(
        columns: global.columns,
        rows: global.rows,
        headingTextStyle: TextStyle(
            color: Colors.greenAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        dataTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  double x;
  double y;
  MyClipper(this.x, this.y);
  @override
  Path getClip(Size size) {
    Path path = Path();
    // 从 60，0 开始
    path.moveTo(0, 0);
    // 二阶贝塞尔曲线画弧
    path.quadraticBezierTo(0, 0, 0, 60);
    // 连接到底部
    path.lineTo(0, size.height / 1.2);
    // 三阶贝塞尔曲线画弧
    path.cubicTo(size.width / x, size.height / y, size.width / 4 * 1.5,
        size.height / 1.5, size.width, size.height / 1.1);
    // 三阶贝塞尔曲线画弧
    //path.cubicTo(size.width - 200, size.height, size.width / 4 * 3,
    // size.height / 1.5, size.width, size.height / 1.1);
    // 再连接回去
    path.lineTo(size.width, 60);
    // 再用二阶贝塞尔曲线画弧
    path.quadraticBezierTo(size.width - 60, 60, size.width - 60, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Animate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(Storage.get("keys"));
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("animate")),
      body: Stack(
        children: [
          Container(
              child: ClipPath(
                  clipper: MyClipper(3, 1.2),
                  child: Container(
                    //width: 500,
                    //height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.deepOrange, Colors.purple[800]],
                    )),
                  ))),
          Positioned(
            top: 20,
            left: 0,
            child: Column(
              children: [
                //ylzFutureBuilder(c.table1(), Colors.white),
                SizedBox(height: 20),
                ylzFutureBuilder(c.table2(), Colors.grey),
                SizedBox(height: 8),
                ylzContainer(
                    width: Get.mediaQuery.size.width / 2,
                    height: Get.mediaQuery.size.width / 14,
                    child: FittedBox(
                        child: Row(
                      children: [
                        Icon(Icons.play_circle_outline_outlined),
                        Icon(Icons.menu),
                        Text("hello"),
                      ],
                    ))),
                AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                        color: Colors.blue,
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Icon(Icons.lock)))
              ],
            ),
          ),
          Positioned(
              left: 20,
              bottom: 50,
              child: ylzButton(func: () => {}, title: "animate"))
        ],
      ),
    );
  }
}
