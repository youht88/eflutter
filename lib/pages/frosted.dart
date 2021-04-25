import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Controller extends GetxController {
  var barcodeScanRes = "".obs;
  void getQrCode() async {
    barcodeScanRes.value = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "取消", false, ScanMode.DEFAULT);
  }
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
              data: "1234567890abcdefghijklmnopqrstuvwxyz",
              version: QrVersions.auto,
              size: 200.0,
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.qr_code_scanner, size: 36),
                onPressed: c.getQrCode,
              ),
            ),
          ],
        ));
  }
}
