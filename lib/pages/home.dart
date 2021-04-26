import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: ListView(children: [
          MyTile(
            title: "login",
            subtitle: "一个login的例子",
            func: () => Get.toNamed("/login"),
          ),
          MyTile(
            title: "config",
            subtitle: "一个config的例子",
            func: () => Get.toNamed("/config", arguments: {"name": "youht"}),
          ),
          MyTile(
            title: "webview",
            subtitle: "一个webview的例子",
            func: () => Get.toNamed("/webview",
                arguments: {"url": "https://flutterchina.club/"}),
          ),
          MyTile(
            title: "echart",
            subtitle: "一个Echart的例子",
            //func: () => Get.toNamed("/echart"),
          ),
          MyTile(
            title: "flchart",
            subtitle: "一个flchart的例子",
            func: () => Get.toNamed("/flchart"),
          ),
          MyTile(
            title: "http",
            subtitle: "一个http的例子",
            func: () => Get.toNamed("/http"),
          ),
          MyTile(
            title: "frosted",
            subtitle: "毛玻璃的例子",
            func: () => Get.toNamed("/frosted"),
          ),
          MyTile(
            title: "path",
            subtitle: "一个path的例子",
            func: () => Get.toNamed("/path"),
          ),
          MyTile(
            title: "launch",
            subtitle: "一个launch的例子",
            func: () => Get.toNamed("/launch"),
          ),
          MyTile(
              title: "qrscan",
              subtitle: "一个扫描二维码的例子",
              func: () => Get.toNamed("/qrscan")),
          MyTile(
            title: "animate",
            subtitle: "动画演示，数字翻板",
            func: () => Get.toNamed("/animate"),
          ),
        ]),
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function func;
  const MyTile({
    this.title,
    this.subtitle,
    this.func,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(Icons.web),
      trailing: GestureDetector(
        onTap: func,
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}
