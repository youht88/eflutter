// import 'package:sm2cipher/sm2cipher.dart' as sm2;

// class Crypto {
//   static Map<String, String> generateKeyPair() {
//     final key = sm2.generateKeyPair();
//     return {
//       "privateKey": sm2.strinifyPrivateKey(key.privateKey),
//       "publicKey": sm2.strinifyPublicKey(key.publicKey),
//     };
//   }

//   static String btcAddress(String publicKey) {
//     return sm2.btcAddress(sm2.loadPublicKey(publicKey));
//   }

//   static String ethAddress(String publicKey) {
//     return sm2.ethAddress(sm2.loadPublicKey(publicKey));
//   }

//   static String getPublicKey(String privateKey) {
//     return sm2.strinifyPublicKeyFromPrivatekey(sm2.loadPrivateKey(privateKey));
//   }

//   static String sign(String message, {String privateKey, String privateFile}) {
//     if (privateFile != null) {
//       return "";
//     }
//     if (privateKey != null) {
//       return sm2.privateSign(privateKey, message);
//     }
//     return "";
//   }

//   static bool verify(String message, String sign,
//       {String publicKey, String publicFile}) {
//     if (publicFile != null) {
//       return false;
//     }
//     if (publicKey != null) {
//       return sm2.publicVerify(publicKey, message, sign);
//     }
//     return false;
//   }

//   static String encrypt(String message,
//       {String privateKey, String privateFile}) {
//     if (privateFile != null) {
//       return "";
//     }
//     if (privateKey != null) {
//       final publicKey = getPublicKey(privateKey);
//       final res = sm2.pubkeyEncrypt(privateKey, publicKey, message);
//       print(res);
//       return res["enc"];
//     }
//     return "";
//   }

//   static String decrypt(String message64,
//       {String privateKey, String privateFile}) {
//     assert(privateKey != null || privateFile != null);
//     assert(!(privateKey != null && privateFile != null));
//     if (privateFile != null) {
//       return "";
//     }
//     if (privateKey != null) {
//       final publicKey = getPublicKey(privateKey);
//       return sm2.privateDecrypt(privateKey, publicKey, message64);
//     }
//     return "";
//   }
// }
