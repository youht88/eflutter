import 'package:eflutter/comm/utils.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  var obj = [].obs;
  @override
  onInit() async {
    super.onInit();
    final esInfo =
        await HttpClient.post("http://youht.cc:18083/es/test/_search", body: {
      "size": 50,
      "query": {
        "match": {"name": "游"}
      }
    });

    obj.value = esInfo['hits']['hits'];
    print(obj.value);
    print("onInit");
  }

  @override
  onClose() {}
  @override
  onReady() {
    print("ready");
  }
}
