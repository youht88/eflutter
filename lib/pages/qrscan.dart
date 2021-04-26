import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  var qrcode = 'no data'.obs;
  var qrcode1 = 'no data';
  var onScan = false.obs;
  QrReaderViewController _controller;
  Future stopScan() async {
    assert(_controller != null);
    await _controller?.stopCamera();
    onScan.value = false;
  }

  Future startScan() async {
    assert(_controller != null);
    onScan.value = true;
    _controller?.startCamera((String result, _) async {
      await stopScan();
      qrcode.value = result;
    });
  }
}

class Qrscan extends StatelessWidget {
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
        title: Text("Qrscan"),
      ),
      body: Obx(() => c.onScan.value
          ? Container(
              width: 320,
              height: 350,
              child: QrReaderView(
                width: 320,
                height: 350,
                callback: (container) {
                  c._controller = container;
                  c.startScan();
                },
              ),
            )
          : Center(
              child: ElevatedButton(
              onPressed: c.startScan,
              child: Text("开始扫描"),
            ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.qrcode1 = "wahaha";
          Get.showSnackbar(GetBar(
              title: "hello",
              message: c.qrcode1,
              duration: Duration(seconds: 3)));
        },
        child: Icon(Icons.account_box_rounded),
      ),
    );
  }
}
