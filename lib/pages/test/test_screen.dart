import 'package:eflutter/comm/utils.dart';
//import 'package:eflutter/pages/card/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'test_controll.dart';
import '../card/card_controll.dart';

class TestPage extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    CardController cardController = Get.put(CardController());
    return Scaffold(
        appBar: AppBar(title: Text('TestPage')),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          color: Colors.red,
                          child: Text(
                              'privateKey:${Storage.get("ecKeyPair")['privateKey']}')),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          color: Colors.blue,
                          child: Text(
                              'publicKey:${Storage.get("ecKeyPair")['publicKey']}')),
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Obx(() => Text("${cardController.temp}"))),
          ],
        ));
  }
}
