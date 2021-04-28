import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cryptography/cryptography.dart';
import 'dart:convert';

class CryptoController extends GetxController {
  List<List<String>> info = [
    ["id", "youht"],
    ["ec.publickey", ""],
    ["ec.privatekey", ""],
    ["rsa.publickey", ""],
    ["rsa.privatekey", " "],
    ["message", "I love flutter & dart!"],
    ["sha256(message)", ""],
    ["sign message use ec", ""],
    ["verify message use ec", ""],
    ["sign message use rsa", ""],
    ["verify message use rsa", ""],
    ["passwd","123456"],
    ["cipher message use ESA", ""],

  ];
  Widget itemBuilder(BuildContext context, int index) {
    return RichText(
      text:TextSpan(
        text:"${info[index][0]}:",
        style:TextStyle(color:Colors.lightBlue,fontSize:12),
        children:[TextSpan(text:"${info[index][1]}",style:TextStyle(color:Colors.deepOrange,))]
      )
    );
  }
  Widget separatorBuilder(BuildContext context, int index) {
    return (index==4 || index==6 || index==10)?Divider(
      color: Colors.lightGreen,
      thickness: 1.5,
    ):Divider(thickness:0.0);
  } 

  @override
  void onInit() async {
    super.onInit();
    var crypto = Ed25519();
    final keyPair = await crypto.newKeyPair();
    info[2][1]=Encoding.ASCII.GetString(await keyPair.extractPrivateKeyBytes());
    print(info);
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
