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
  Storage.get("keys") ?? Storage.set("keys", "youht88");
  Storage.get("ecKeyPair") ?? Storage.set("ecKeyPair", CryptoLib.genKeyPair());
  Storage.get("rsaKeyPair") ??
      Storage.set("rsaKeyPair", CryptoLib.genKeyPair(algType: "RSA"));
}
