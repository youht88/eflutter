import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  var _url = 'https://www.baidu.com'.obs;
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
        body: Column(children: [
          Container(width: 300, height: 100, color: Colors.purple[100]),
          Container(width: 300, height: 100, color: Colors.purple[100]),
        ]));
  }
}
