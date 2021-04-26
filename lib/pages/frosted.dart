import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:qr_flutter/qr_flutter.dart';

//ScanController controller = ScanController();

class Controller extends GetxController {
  var qrcode = "".obs;
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

class FrostedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("毛玻璃效果"),
        ),
        body: Column(
          children: [
            Container(
              width: 500,
              height: 300,
              child: Stack(children: [
                ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.network(
                      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2496571732,442429806&fm=26&gp=0.jpg'),
                ),
                Center(
                  child: ClipRect(
                    // 可裁切矩形
                    child: BackdropFilter(
                      // 背景过滤器
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Text('Hello',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 36)),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            QrImage(
              data: "1234567890abcdefghijklmnopqrstuvwxyz",
              version: QrVersions.auto,
              size: 200.0,
            ),
            Expanded(
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
                    )))
          ],
        ));
  }
}
