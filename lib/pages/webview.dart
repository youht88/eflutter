import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class Webview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    print(args);
    final WebviewController c = Get.put(WebviewController());

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Webview"),
      ),
      body: WebView(initialUrl: args["url"]),
    );
  }
}
