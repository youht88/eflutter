import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cryptography/cryptography.dart';

class CryptoController extends GetxController {
  List<List<String>> info = [
    ["id", "youht"],
    ["message", "I love flutter & dart!"],
    ["ec.publickey", ""],
    ["ec.privatekey", ""],
    ["rsa.publickey", ""],
    ["rsa.privatekey", " "]
  ];
  Widget itemBuilder(BuildContext context, int index) {
    return Text("${info[index][0]}:${info[index][1]}");
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return Divider(
      color: Colors.lightGreen,
      thickness: 3,
    );
  } 

  @override
  void onInit() async {
    super.onInit();
    var crypto = Ed25519();
    final keyPair = await crypto.newKeyPair();
    print(keyPair);
  }
  @override
  void on
}

class CryptoPage extends GetView<CryptoController> {
  @override
  Widget build(BuildContext context) {
    CryptoController c = Get.put(CryptoController());
    return Scaffold(
      appBar: AppBar(title: Text('CryptoPage')),
      body: Center(
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              itemBuilder: c.itemBuilder,
              separatorBuilder: c.separatorBuilder,
              itemCount: c.info.length)),
    );
  }
}
