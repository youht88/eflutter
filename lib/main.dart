import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/route.dart';
import 'comm/utils.dart';
import 'dart:convert';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    initialRoute: MyRoutes.initialPath,
    getPages: MyRoutes.routes,
    unknownRoute: MyRoutes.unknowRoute,
  ));
}

void init() async {
  Storage.get("keys") ?? Storage.set("keys", "24345");
  print(Storage.get('keys'));
}
