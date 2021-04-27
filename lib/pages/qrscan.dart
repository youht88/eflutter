import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:barcode_scan/barcode_scan.dart';

import '../comm/utils.dart';

class ScanController extends GetxController {
  var result = 'no data'.obs;
  Future scanQR() async {
    try {
      // 此处为扫码结果，barcode为二维码的内容
      result.value = await BarcodeScanner.scan();
      print('扫码结果: ' + result.value);
    } catch (e) {
      // 扫码错误
      print('扫码错误: $e');
    }
  }
}

class Qrscan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(Storage.get("keys"));
    final ScanController c = Get.put(ScanController());
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(result: {"result": c.result.value}),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Qrscan"),
        ),
        body: Center(
          child: Obx(() => Text(
                c.result.value,
                style:
                    new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera_alt),
          label: Text("Scan"),
          onPressed: c.scanQR,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
