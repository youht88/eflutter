import 'dart:convert';
import 'package:get/get.dart';

class HttpClient {
  static final httpClient = GetHttpClient();
  static get(String url) async {
    final res;
    Response? response = await httpClient.get(url);
    if (response.statusCode == 200) {
      res = json.decode(response.bodyString!);
      return res;
    }
    throw '网络异常,${response.statusText}';
  }

  static post(String url, {Map? body}) async {
    final res;
    var response = await httpClient.post(url, body: body);
    if (response.statusCode == 200) {
      res = json.decode(response.bodyString!);
      return res;
    }
    throw '网络异常,${response.statusText}';
  }
}
