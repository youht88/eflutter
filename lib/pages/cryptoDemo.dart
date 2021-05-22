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
    return (index == 4 || index == 6 || index == 10 || index == 12)
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
    //EC Sign/Verify
    info["ec.sign.message"] = CryptoLib.sign("abcd", info["ec.privatekey"]!);
    info["ec.verify.message"] =
        '${CryptoLib.verify("abcd", info["ec.publickey"]!, info["ec.sign.message"]!)}';
    //RSA Sign/Verify
    info["rsa.sign.message"] =
        CryptoLib.sign("abcd", info["rsa.privatekey"]!, algType: "RSA");
    info["rsa.verify.message"] =
        '${CryptoLib.verify("abcd", info["rsa.publickey"]!, info["rsa.sign.message"]!, algType: "RSA")}';
    //sha256
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
    final toSend = CryptoLib.safeSend(
      msg: "My name is youht!",
      passwd: "9876543210ab", //length of passwd must be multi of 4
      selfECPrivateKey: info["ec.privatekey"]!,
      altRSAPublicKey: info["rsa.publickey"]!,
    );
    print(toSend);
    final msg = CryptoLib.safeRecieve(
        sigObjStr: toSend, selfRSAPrivateKey: info["rsa.privatekey"]!);
    print(msg);
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
