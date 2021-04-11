import 'dart:convert';
import 'package:get/get.dart';

class HttpClient {
  static final httpClient = GetHttpClient();
  static get(String url) async {
    var response = await httpClient.get(url);
    var res = json.decode(response.bodyString);
    return res;
  }

  static post(String url, {Map body}) async {
    var response = await httpClient.post(url, body: body);
    var res = json.decode(response.bodyString);
    return res;
  }
}
