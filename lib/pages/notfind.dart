import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknowController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class Unknow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UnknowController c = Get.put(UnknowController());
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("not find page"),
        ),
        body: Center(child: Text("not find!!")));
  }
}
