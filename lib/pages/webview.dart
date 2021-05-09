import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends GetxController {}

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
      body: //WebView(initialUrl: args["url"]),
          //SizedBox(height: 8),
          GetPlatform.isWeb
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("不支持Web"),
                )
              : WebView(
                  initialUrl:
                      "http://localhost:28080/ipns/bafzm3jqbedgk66fls373ftdpwxcmt33plqkqobpux47d5k3bjluka7yqmpnr2"),
    );
  }
}
