import 'package:eflutter/comm/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cryptography/cryptography.dart';
import 'dart:convert';

class CryptoController extends GetxController {
  var info = {
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
    final cryptoEC = Ed25519();
    final keyPair = await CryptoLib.genKeyPair();
    info["ec.privatekey"] = keyPair["privateKey"];
    info["ec.publickey"] = keyPair["publicKey"];
    //sign
    var sign0 = await CryptoLib.sign(
      info["message"],
      keyPair["privateKey"],
    );
    var sign = {"sign": sign0.bytes, "publickey": sign0.publicKey};
    info["ec.sign.message"] = base64Encode(sign["sign"]);
    //info["ec.verify.message"] = (await cryptoEC.verify(
    //  utf8.encode(info["message"]),
    //  signature: Signature(sign["sign"], publicKey: sign["publicKey"]),
    //))
    //    .toString();
    //
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
