import 'package:eflutter/comm/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert';

class CryptoController extends GetxController {
  Map<String, String> info = {
    "id": "youht",
    "ec.publickey": "",
    "ec.privatekey": "",
    "rsa.publickey": "",
    "rsa.privatekey": " ",
    "message": "I love flutter & dart!",
    "message.sha256": "",
    "ec.sign.message": "",
    "ec.verify.message": "",
    "rsa.sign.message": "",
    "rsa.verify.message": "",
    "passwd": "123456",
    "ESA.cipher.message": "",
  };
  Widget itemBuilder(BuildContext context, int index) {
    return RichText(
        text: TextSpan(
            text: "${info.keys.toList()[index]}:",
            style: TextStyle(color: Colors.lightBlue, fontSize: 12),
            children: [
          TextSpan(
              text: "${info.values.toList()[index]}",
              style: TextStyle(
                color: Colors.deepOrange,
              ))
        ]));
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return (index == 4 || index == 6 || index == 10)
        ? Divider(
            color: Colors.lightGreen,
            thickness: 1.5,
          )
        : Divider(thickness: 0.0);
  }

  @override
  void onInit() async {
    final store = await CryptoLib.keystore();
    print("=====>:$store");
    final keyPair = await CryptoLib.genKeyPair();
    info["ec.privatekey"] = keyPair["privateKey"];
    info["ec.publickey"] = keyPair["publicKey"];
    //sign
    info["ec.sign.message"] = CryptoLib.sign("abcd", info["ec.privatekey"]);

    if (CryptoLib.verify(
        "abcd", info["ec.publickey"], info["ec.sign.message"])) {
      info["ec.verify.message"] = "ok";
    } else {
      info["ec.verify.message"] = "error";
    }
    info["message.sha256"] = await HashLib.sha256(info["message"]);
    print(info);
    super.onInit();
  }
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
