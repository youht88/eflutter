import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class FrostedController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class FrostedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final FrostedController c = Get.put(FrostedController());

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("毛玻璃效果"),
        ),
        body: Stack(children: [
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
                    decoration: BoxDecoration(color: Colors.grey.shade500),
                    child: Text('Janise',
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
