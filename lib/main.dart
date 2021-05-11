import 'package:eflutter/language.dart';
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
    translations: Languages(), // 你的翻译
    locale: Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
    fallbackLocale: Locale('en', 'US'),
    debugShowCheckedModeBanner: false,
    initialRoute: MyRoutes.initialPath,
    getPages: MyRoutes.routes,
    unknownRoute: MyRoutes.unknowRoute,
  ));
}

init() async {
  Storage.get("keys") ?? Storage.set("keys", "youht88");
  Storage.get("ecKeyPair") ?? Storage.set("ecKeyPair", CryptoLib.genKeyPair());
  Storage.get("rsaKeyPair") ??
      Storage.set("rsaKeyPair", CryptoLib.genKeyPair(algType: "RSA"));
}
