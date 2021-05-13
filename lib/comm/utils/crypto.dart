import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:steel_crypt/steel_crypt.dart';
import 'dart:convert';

//import 'package:flutter_key_store_cryptography/cipher.dart' as Keystroe;

//以下算法以方便传输为目标，所有传入的数据如果是二进制则需要base64转码，
//所有输出如果是二进制则自动转为base64字串
class CryptoLib {
  static genKeyPair({algType: "EC"}) {
    assert(algType == "EC" || algType == "RSA");
    if (algType == "RSA") {
      final keyPair = RSAKeypair.fromRandom();
      return {
        "privateKey": keyPair.privateKey.toString(),
        "publicKey": keyPair.publicKey.toString()
      };
    }
    if (algType == "EC") {
      final keyPair = ECKeypair.fromRandom();
      return {
        "privateKey": keyPair.privateKey.toString(),
        "publicKey": keyPair.publicKey.toString()
      };
    }
  }

  static Map<String, String> str2pem(Map<String, String> keyPair,
      {algType = "RSA"}) {
    assert(algType == "RSA");
    Map<String, String> keys = {};
    keys["privateKey"] =
        RSAPrivateKey.fromString(keyPair["privateKey"]!).toFormattedPEM();
    keys["publicKey"] =
        RSAPublicKey.fromString(keyPair["publicKey"]!).toFormattedPEM();
    return keyPair;
  }

  static Map<String, String> pem2str(Map<String, String> keyPair,
      {algType = "RSA"}) {
    assert(algType == "RSA");
    Map<String, String> keys = {};
    keys["privateKey"] =
        RSAPrivateKey.fromPEM(keyPair["privateKey"]!).toString();
    keys["publicKey"] = RSAPublicKey.fromPEM(keyPair["publicKey"]!).toString();
    return keyPair;
  }

  //如果msg是二进制，则用base64转码为字符串。默认用sha256
  static String sign(String msg, String privateKey,
      {algType: "EC", hashType: "sha256"}) {
    assert(algType == "RSA" || algType == "EC");
    assert(hashType == "sha256" || hashType == "sha512");
    if (algType == "RSA" && hashType == "sha256") {
      return base64Encode(RSAPrivateKey.fromString(privateKey)
          .createSHA256Signature(Uint8List.fromList(utf8.encode(msg))));
    }
    if (algType == "EC" && hashType == "sha256") {
      return base64Encode(ECPrivateKey.fromString(privateKey)
          .createSHA256Signature(Uint8List.fromList(utf8.encode(msg))));
    }
    if (algType == "RSA" && hashType == "sha512") {
      return base64Encode(RSAPrivateKey.fromString(privateKey)
          .createSHA512Signature(Uint8List.fromList(utf8.encode(msg))));
    }
    if (algType == "EC" && hashType == "sha512") {
      return base64Encode(ECPrivateKey.fromString(privateKey)
          .createSHA512Signature(Uint8List.fromList(utf8.encode(msg))));
    }
    throw Exception(
        "sign function must use algType(EC/RSA) and hashType(sha256/sha512)");
  }

  static bool verify(String msg, String publicKey, String sign,
      {algType: "EC", hashType: "sha256"}) {
    assert(algType == "RSA" || algType == "EC");
    assert(hashType == "sha256" || hashType == "sha512");
    if (algType == "EC" && hashType == "sha256") {
      return ECPublicKey.fromString(publicKey).verifySHA256Signature(
          Uint8List.fromList(utf8.encode(msg)), base64Decode(sign));
    }
    if (algType == "RSA" && hashType == "sha256") {
      return RSAPublicKey.fromString(publicKey).verifySHA256Signature(
          Uint8List.fromList(utf8.encode(msg)), base64Decode(sign));
    }
    if (algType == "EC" && hashType == "sha512") {
      return ECPublicKey.fromString(publicKey).verifySHA512Signature(
          Uint8List.fromList(utf8.encode(msg)), base64Decode(sign));
    }
    if (algType == "RSA" && hashType == "sha512") {
      return RSAPublicKey.fromString(publicKey).verifySHA512Signature(
          Uint8List.fromList(utf8.encode(msg)), base64Decode(sign));
    }
    throw Exception(
        "verify function must use algType(EC/RSA) and hashType(sha256/sha512)");
  }

  static String encrypt(String msg, String publicKey, {algType: "RSA"}) {
    assert(algType == "RSA");
    return RSAPublicKey.fromString(publicKey).encrypt(msg);
  }

  static decrypt(String emsg, String privateKey, {algType: "RSA"}) {
    assert(algType == "RSA");
    return RSAPrivateKey.fromString(privateKey).decrypt(emsg);
  }

  static String encipher(String msg, String passwd) {
    //var keyGen = CryptKey();
    //var key32 = keyGen.genFortuna(len: 32);
    //print(key32);
    var key32 = "27rBVp7xgUK9RCKCD//2jLCxct2Nf3cqdaahHWMVb4w=";
    var aes = AesCrypt(key: key32, padding: PaddingAES.pkcs7);
    var emsg = aes.ctr.encrypt(inp: msg, iv: passwd); //Encrypt.
    return emsg;
  }

  static String decipher(String emsg, String passwd) {
    //var keyGen = CryptKey();
    //var key32 = keyGen.genFortuna(len: 32);
    var key32 = "27rBVp7xgUK9RCKCD//2jLCxct2Nf3cqdaahHWMVb4w=";
    var aes = AesCrypt(key: key32, padding: PaddingAES.pkcs7);
    return aes.ctr.decrypt(enc: emsg, iv: passwd); //Decrypt.
  }

  static String safeSend(
      {required String msg,
      String? passwd,
      required String selfECPrivateKey,
      required String altRSAPublicKey}) {
    //如果存在passwd，说明需要用passwd对称加密原始数据msg
    var msgObj = {"msg": msg};
    if (passwd != null) {
      msgObj = {"msg": encipher(msg, passwd), "passwd": passwd};
    }
    //用对方的RSA公钥加密 msgObj数据
    final eData = CryptoLib.encrypt(
      json.encode(msgObj),
      altRSAPublicKey,
      algType: "RSA",
    );
    final toSend = {"eData": eData, "RSAPublicKey": altRSAPublicKey};
    //用自己的EC私钥签名
    final sig = CryptoLib.sign(json.encode(toSend), selfECPrivateKey);
    final sigObj = {
      "msg": toSend,
      "sig": sig,
      "ECPublicKey":
          ECPrivateKey.fromString(selfECPrivateKey).publicKey.toString()
    };

    return json.encode(sigObj);
  }

  static String safeRecieve({
    required String sigObjStr,
    required String selfRSAPrivateKey,
  }) {
    //转化为sigObj对象
    final sigObj = json.decode(sigObjStr);
    //验证数据完整性
    assert(verify(
        json.encode(sigObj["msg"]), sigObj["ECPublicKey"], sigObj["sig"]));
    print("通过签名验证！！");
    //解密获得数据串
    final msgObjStr =
        CryptoLib.decrypt(sigObj["msg"]["eData"], selfRSAPrivateKey);
    //解析数据串中的加密串和密文，二次对称解密
    final msgObj = json.decode(msgObjStr);
    var msg = msgObj["msg"];
    if (msgObj["passwd"] != null) {
      msg = decipher(msg, msgObj["passwd"]);
    }
    return msg;
  }
}

class HashLib {
  static String _shax(String msg, algo) {
    //assert(msg.runtimeType == String);
    //if (msg.runtimeType == String) {
    return HashCrypt(algo: algo).hash(inp: msg);
  }

  static String sha256(dynamic msg) {
    var result = _shax(msg, HashAlgo.Sha_256);
    return result;
  }

  static String sha512(dynamic msg) {
    var result = _shax(msg, HashAlgo.Sha_512);
    return result;
  }
}
