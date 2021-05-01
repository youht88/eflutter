import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'dart:convert';

//import 'package:flutter_key_store_cryptography/cipher.dart' as Keystroe;

//以下算法以方便传输为目标，所有传入的数据如果是二进制则需要base64转码，
//所有输出如果是二进制则自动转为base64字串
class CryptoLib {
  static genKeyPair({algType: "RSA", isPEM: false}) {
    if (algType == "RSA") {
      final keyPair = RSAKeypair.fromRandom();
      if (isPEM) {
        return {
          "privateKey": keyPair.privateKey.toString(),
          "publicKey": keyPair.publicKey.toString()
        };
      } else {
        return {
          "privateKey": keyPair.privateKey.toString(),
          "publicKey": keyPair.publicKey.toString()
        };
      }
    }
    if (algType == "EC") {
      final keyPair = ECKeypair.fromRandom();
      if (isPEM) {
        return {
          "privateKey": keyPair.privateKey.toString(),
          "publicKey": keyPair.publicKey.toString()
        };
      } else {
        return {
          "privateKey": keyPair.privateKey.toString(),
          "publicKey": keyPair.publicKey.toString()
        };
      }
    }
  }

  //如果msg是二进制，则用base64转码为字符串。默认用sha256
  static String sign(String msg, String privateKey,
      {algType: "RSA", hashType: "sha256"}) {
    if (algType == "RSA" && hashType == "sha256") {
      return base64Encode(RSAPrivateKey.fromString(privateKey)
          .createSHA256Signature(utf8.encode(msg)));
    }
    if (algType == "EC" && hashType == "sha256") {
      return base64Encode(ECPrivateKey.fromString(privateKey)
          .createSHA256Signature(utf8.encode(msg)));
    }
    if (algType == "RSA" && hashType == "sha512") {
      return base64Encode(RSAPrivateKey.fromString(privateKey)
          .createSHA512Signature(utf8.encode(msg)));
    }
    if (algType == "EC" && hashType == "sha512") {
      return base64Encode(ECPrivateKey.fromString(privateKey)
          .createSHA512Signature(utf8.encode(msg)));
    }
    return "";
  }

  static bool verify(String msg, String publicKey, String sign) {
    return RSAPublicKey.fromString(publicKey)
        .verifySHA256Signature(base64Decode(msg), base64Decode(sign));
  }

  static encrypt(String msg, String publicKey) async {}
  static decrypt(String emsg, String privateKey) async {}
  static encipher(String msg, String passwd) async {}
  static decipher(String emsg, String passwd) async {}
  static keystore() async {
    return "abcd";
    //return Keystroe.Cipher.getPublicKey();
  }
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
    //var result = await shax(msg, Sha256());
    //return result;
    return "aaa";
  }

  static sha512(dynamic msg) async {
    //var result = await shax(msg, Sha512());
    //return result;
    return "xxxzz";
  }
}
