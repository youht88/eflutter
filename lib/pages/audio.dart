import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_sound/flutter_sound.dart';

import '../comm/utils.dart';

class Controller extends GetxController {}

class AudioView extends StatelessWidget {
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
            title: Text("audio")),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {Get.defaultDialog()},
                child: Text("录音"),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: Text("播放"),
              ),
            ],
          )
        ]));
  }
}
