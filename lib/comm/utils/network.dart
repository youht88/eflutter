import 'dart:convert';
import 'package:get/get.dart';

class HttpClient {
  static final httpClient = GetHttpClient();
  static get(String url) async {
    Response response = await httpClient.get(url);
    if (response.status.code == 200){
      var res = json.decode(response.bodyString!);
      return res;
    }
  }

  static post(String url, {Map? body}) async {
    var response = await httpClient.post(url, body: body);
    if (response.status.code == 200){
      var res = json.decode(response.bodyString!);
      return res;
    }
  }
}
