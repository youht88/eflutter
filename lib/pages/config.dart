import 'package:eflutter/comm/components/expansionPanelList.dart';
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
        // ClipPath(
        //   clipper: MyPath(),
        //   child: Container(width: 150, height: 150, color: Colors.green),
        // ),
        Padding(
          padding: EdgeInsets.all(50),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text("hello1",
                      style: TextStyle(backgroundColor: Colors.blue)),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text("good",
                      style: TextStyle(backgroundColor: Colors.red))),
            ],
          ),
        ),
        Center(
          child: Container(child: Text("hello ${args['name']}!!")),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          ylzExpansionPanelList([
            {"head": Text("youht"), "detail": Text("body detail")},
            {"head": Text("youyc"), "detail": Text("body detail")},
            {"head": Text("jinli"), "detail": Text("body detail")}
          ]),
        ]),
        Align(
          alignment: Alignment(0.75, -0.75),
          child: Obx(() => Container(
                width: 150,
                height: 50,
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
