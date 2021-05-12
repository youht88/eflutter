import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:qr_flutter/qr_flutter.dart';
import '../comm/utils.dart';

//ScanController controller = ScanController();

class Controller extends GetxController {
  var qrcode = "".obs;
  var qrcode1 = "".obs;
  var xxx;
  var textData = "".obs;
}

class FrostedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("毛玻璃效果"),
        ),
        body: Column(
          children: [
            Container(
              width: 500,
              height: 300,
              child: Stack(children: [
                ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Image.network(
                      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2496571732,442429806&fm=26&gp=0.jpg'),
                ),
                Center(
                  child: ClipRect(
                    // 可裁切矩形
                    child: BackdropFilter(
                      // 背景过滤器
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Opacity(
                        opacity: 0.5,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Text('Hello',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 36)),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            QrImage(
              data: Storage.get("rsaKeyPair")["publicKey"],
              version: QrVersions.auto,
              size: 200.0,
            ),
            Row(children: [
              ElevatedButton.icon(
                  icon: Icon(Icons.menu),
                  label: Text("read publickey"),
                  // onPressed: () async {
                  //   c.qrcode1.value =
                  //       await Get.toNamed("/qrscan", arguments: {});
                  // }),
                  onPressed: () async {
                    c.xxx = await Get.toNamed("/qrscan", arguments: {});
                    print(c.xxx);
                    c.qrcode1.value = c.xxx["result"];
                    //test safeSend function
                    // c.textData.value = CryptoLib.safeSend(
                    //     "what a fun!",
                    //     Storage.get("ecKeyPair")["privateKey"],
                    //     c.xxx["result"]);
                  }),
              SizedBox(width: 16),
              Obx(() => c.qrcode1.value == ""
                  ? Container()
                  : Text("code is :${c.qrcode1.value}")),
            ]),
            //QrImage(
            //  data: "${c.textData.value}",
            //  version: QrVersions.auto,
            //  size: 200.0,
            //),
            // Row(children: [
            //   ElevatedButton.icon(
            //       icon: Icon(Icons.menu),
            //       label: Text("read data"),
            //       // onPressed: () async {
            //       //   c.qrcode1.value =
            //       //       await Get.toNamed("/qrscan", arguments: {});
            //       // }),
            //       onPressed: () async {
            //         c.xxx = await Get.toNamed("/qrscan", arguments: {});
            //         final testData1 = CryptoLib.safeRecieve(c.xxx["result"],
            //             Storage.get("rsaKeyPair")["privateKey"]);
            //         Get.defaultDialog(content: Text(testData1));
            //       }),
            //   SizedBox(width: 16),
            //   Obx(() => c.qrcode1.value == ""
            //       ? Container()
            //       : Text("code is :${c.qrcode1.value}")),
            //])
          ],
        ));
  }
}
