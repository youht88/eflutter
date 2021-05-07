import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:flutter_sound/flutter_sound.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  // FlutterSoundRecorder recorder;
  // FlutterSoundPlayer player;
  // startRecord() async {
  //   recorder = await FlutterSoundRecorder().openAudioSession();
  //   recorder.startRecorder(toFile: "foo");
  // }

  // stopRecord() async {
  //   String anURL = await recorder.stopRecorder();
  //   Get.defaultDialog(content: Text(anURL));
  // }

  // startPlay() async {
  //   player = await FlutterSoundPlayer().openAudioSession();
  //   player.startPlayer(fromURI: "foo");
  // }

  // @override
  // void onClose() {
  //   if (recorder != null) {
  //     recorder.closeAudioSession();
  //     recorder = null;
  //   }
  //   if (player != null) {
  //     player.closeAudioSession();
  //     player = null;
  //   }
  //   super.onClose();
  // }
}

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
                //onPressed: () => c.startRecord(),
                child: Text("录音"),
              ),
              ElevatedButton(
                //onPressed: () => c.stopRecord(),
                child: Text("stop"),
              ),
              ElevatedButton(
                //onPressed: () => c.startPlay(),
                child: Text("播放"),
              ),
            ],
          )
        ]));
  }
}
