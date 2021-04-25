import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("login"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: 250,
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Strawberry Pavlova",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          )),
                      Text(
                        "Pavlova is meringue-based desert named after the Rassian ballerina Anna Pavlova.Pavlova features a crisp crust and soft,light inside,topped whth fruit and whipped cream.",
                        maxLines: 5,
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                              ],
                            ),
                            Text("170 Reviews",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ]),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.book, color: Colors.greenAccent),
                              Text("PREP:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("25 min",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_clock),
                              Text("COOK:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("1 hr",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.food_bank_sharp),
                              Text("FEEDS:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("4-6 ",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          topRight: Radius.circular(150))),
                  child: Image.asset(
                    "assets/images/fj1.jpeg",
                    fit: BoxFit.cover,
                  )))
        ]));
  }
}
