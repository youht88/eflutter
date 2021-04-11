import "package:flutter/material.dart";
import "package:get/get.dart";

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/fl"),
      child: Center(
          child: Container(
              child: Text(
        "fl-图表",
        style: TextStyle(fontSize: 30),
      ))),
    );
  }
}
