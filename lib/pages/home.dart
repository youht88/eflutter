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