import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';

import 'routes.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'utils/util.dart';

import 'package:curved_bottom_navigation/curved_bottom_navigation.dart';

Future main() async {
  // ignore: await_only_futures
  await init();
  runApp(MyApp());
}

void init() async {
  await GetStorage.init();
  final box = GetStorage();
  if (box.read('keys') == null) {
    //final keys = Crypto.generateKeyPair();
    //box.write('keys', keys);
  }
  print(box.read('keys'));
}

class Controller extends GetxController {
  var navPos = 0.obs;
  void setNavPos(int i) => navPos.value = i;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //initialRoute: ("/"),
        routes: MyRoute.routes,
        home: Scaffold(
            appBar: AppBar(title: Text("title")),
            bottomNavigationBar: Align(
              alignment: Alignment.bottomCenter,
              child: CurvedBottomNavigation(
                selected: Obx(() => c.navPos.value),
                onItemClick: (i) => c.setNavPos(i),
                items: [
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.star, color: Colors.white),
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.notifications, color: Colors.white),
                  Icon(Icons.settings, color: Colors.white),
                ],
              ),
            )));
  }
}
