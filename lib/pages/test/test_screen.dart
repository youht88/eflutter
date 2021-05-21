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
        body: Column(children: [
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
          Obx(() => Container(
                height: 400,
                child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: controller.obj.length,
                    itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                            child: Text(
                                "${controller.obj[index]['_source']['grade']}")),
                        title: Text(
                            "${controller.obj[index]['_source']['name']}",
                            style:
                                TextStyle(fontSize: 20, color: Colors.amber)),
                        subtitle: Text(
                            "${controller.obj[index]['_source']['score']}"))),
              )),
          //制作一个精美的组件
          SizedBox(height: 20),

          Row(
            children: [
              FoodView(Colors.blueAccent, "Breakfast",
                  ["Bread", "Peanet butter", "Apple"], 525),
              FoodView(Colors.orangeAccent, "Lunch",
                  ["Salmon,", "Mixed veggles,", "Avocado"], 602),
              FoodView(Colors.pinkAccent, "Snack", ["eggs,", "milk"], 200),
              FoodView(Colors.lightGreen, "Dinner", ["Cake"], 400),
            ],
          ),
        ]));
  }
}

class FoodView extends GetView<CardController> {
  Color cl;
  String title;
  List<String> arr;
  int value;
  FoodView(this.cl, this.title, this.arr, this.value);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(3),
      child: Container(
        child: Stack(
          children: [
            Container(
                height: 170,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30)),
                  gradient: LinearGradient(colors: [cl, cl.withAlpha(400)]),
                )),
            Positioned(
                top: -30,
                left: -20,
                width: 90,
                height: 90,
                child: CircleAvatar(backgroundColor: cl.withAlpha(200))),
            Positioned(
                top: 60,
                left: 15,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$title",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      SizedBox(height: 10),
                      // ListView.builder(
                      //   itemCount: arr.length,
                      //   itemBuilder: (context, idx) => Text("${arr[idx]}",
                      //       textAlign: TextAlign.left,
                      //       style: TextStyle(color: Colors.white, fontSize: 8)),
                      // ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "$value",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          TextSpan(
                              text: "kcal",
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white))
                        ]),
                        textAlign: TextAlign.left,
                      ),
                    ])),
            Positioned(
                left: 20,
                child: Placeholder(
                    fallbackWidth: 25,
                    fallbackHeight: 30,
                    color: cl.withAlpha(200))),
          ],
        ),
      ),
    ));
  }
}
