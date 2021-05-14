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
    "rsa.privatekey": "",
    "rsa.publickey.pem": "",
    "rsa.privatekey.pem": "",
    "message": "I love flutter & dart!",
    "message.md5": "",
    "message.sha256": "",
    "ec.sign.message": "",
    "ec.verify.message": "",
    "rsa.sign.message": "",
    "rsa.verify.message": "",
    "rsa.encrypt.message": "",
    "rsa.decrypt.message": "",
    "passwd": "12345678",
    "AES.encipher.message": "",
    "AES.decipher.message": "",
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
    return (index == 6 ||
            index == 9 ||
            index == 13 ||
            index == 15 ||
            index == 18)
        ? Divider(
            color: Colors.lightGreen,
            thickness: 1.5,
          )
        : Divider(thickness: 0.0);
  }

  @override
  void onInit() {
    //final store = await CryptoLib.keystore();
    //print("=====>:$store");
    final keyPairEC = CryptoLib.genKeyPair();
    info["ec.privatekey"] = keyPairEC["privateKey"];
    info["ec.publickey"] = keyPairEC["publicKey"];
    final keyPairRSA = CryptoLib.genKeyPair(algType: "RSA");
    info["rsa.privatekey"] = keyPairRSA["privateKey"];
    info["rsa.publickey"] = keyPairRSA["publicKey"];
    final keyPairRSApem = CryptoLib.str2pem(keyPairRSA);
    info["rsa.privatekey.pem"] = keyPairRSApem["privateKey"]!;
    info["rsa.publickey.pem"] = keyPairRSApem["publicKey"]!;
    //EC Sign/Verify
    info["ec.sign.message"] = CryptoLib.sign("abcd", info["ec.privatekey"]!);
    info["ec.verify.message"] =
        '${CryptoLib.verify("abcd", info["ec.publickey"]!, info["ec.sign.message"]!)}';
    //RSA Sign/Verify
    info["rsa.sign.message"] =
        CryptoLib.sign("abcd", info["rsa.privatekey"]!, algType: "RSA");
    info["rsa.verify.message"] =
        '${CryptoLib.verify("abcd", info["rsa.publickey"]!, info["rsa.sign.message"]!, algType: "RSA")}';
    //md5 & sha256
    info["message.md5"] = HashLib.md5(info["message"]);
    info["message.sha256"] = HashLib.sha256(info["message"]);
    //rsa ecrypt/decrypt
    info["rsa.encrypt.message"] =
        CryptoLib.encrypt(info["message"]!, info["rsa.publickey"]!);
    info["rsa.decrypt.message"] = CryptoLib.decrypt(
        info["rsa.encrypt.message"]!, info["rsa.privatekey"]!);
    //aes encipher/decipher
    info["AES.encipher.message"] =
        CryptoLib.encipher(info["message"]!, info["passwd"]!);
    info["AES.decipher.message"] =
        CryptoLib.decipher(info["AES.encipher.message"]!, info["passwd"]!);
    //print(info);
    info["safeSend"] = CryptoLib.safeSend(
      msg: "你好，游海涛!!",
      passwd: "9876543210ab",
      selfECPrivateKey: info["ec.privatekey"]!,
      altRSAPublicKey: info["rsa.publickey"]!,
    );
    print(info["safeSend"]);
    info["safeRecieve"] = CryptoLib.safeRecieve(
        sigObjStr: info["safeSend"]!,
        selfRSAPrivateKey: info["rsa.privatekey"]!);
    print(info["safeRecieve"]);
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
