import "package:flutter/material.dart";
import "package:get/get.dart";

class FlHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(Icons.arrow_back),
      ),
      title: Text("FL 图表示例"),
    ));
  }
}
