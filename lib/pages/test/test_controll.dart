import 'package:eflutter/comm/utils.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  var obj = [].obs;
  @override
  onInit() async {
    super.onInit();
    //var user1, user2, user3, user4;
    try {
      final esInfo =
          await HttpClient.post("http://youht.cc:18083/es/test/_search", body: {
        "size": 150,
        "query": {
          "match": {"name": "国家"}
        }
      });
      //if esInfo
      obj.value = esInfo['hits']['hits'];
      //print(obj.value);
    } catch (e) {
      print(e);
    }
    print("onInit");
  }

  @override
  onClose() {}
  @override
  onReady() {
    print("ready");
  }
}
