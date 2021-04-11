import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  var s = ''.obs;
  adds() => s.value = s.value + 's';
}

class Config extends StatelessWidget {
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
        title: Text("Config"),
      ),
      body: Stack(children: [
        Center(
          child: Container(child: Text("hello ${args['name']}!!")),
        ),
        Align(
          alignment: Alignment(0.75, -0.75),
          child: Obx(() => Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text("${c.s}",
                      style: TextStyle(color: Colors.redAccent, fontSize: 40)),
                ),
              )),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: c.adds,
        child: Icon(Icons.account_box_rounded),
      ),
    );
  }
}
