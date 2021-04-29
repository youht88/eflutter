import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'dart:convert';

class CryptoLib {
  static genKeyPair() async {}
  //如果msg是二进制，则用base64转码为字符串。默认用sha256
  static sign(String msg, String privateKey) async {}
  static verify(String msg, String publicKey, String sign) async {}
  static encrypt(String msg, String publicKey) async {}
  static decrypt(String emsg, String privateKey) async {}
  static encipher(String msg, String passwd) async {}
  static decipher(String emsg, String passwd) async {}
}

class HashLib {
  static shax(dynamic msg, algro) async {
    assert(msg.runtimeType == String);
    var sink = algro.newHashSink();
    sink.add(utf8.encode(msg));
    sink.close();
    var hash = await sink.hash();
    return base64Encode(hash.bytes);
  }

  static sha256(dynamic msg) async {
    var result = await shax(msg, Sha256());
    return result;
  }

  static sha512(dynamic msg) async {
    var result = await shax(msg, Sha512());
    return result;
  }
}
