import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final ConfigController c = Get.put(ConfigController());
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Config"),
        ),
        body: Center(
          child: Container(child: Text("hello ${args['name']}!!")),
        ));
  }
}
