import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  var esName = ''.obs;
  var esUuid = ''.obs;
  var firstName = ''.obs;
  late Rx<List<Widget>> data;
  void getData() async {
    final res1 = await HttpClient.get("http://youht.cc:18083/es/");
    final res2 =
        await HttpClient.post("http://youht.cc:18083/es/qjzid2/_search", body: {
      "size": 50,
      "query": {
        "match": {"name": "张"}
      }
    });
    if (res1 != null) {
      esName.value = res1?['name'];
      esUuid.value = res1?['cluster_uuid'];
    } else {
      print("res1 is null");
    }
    if (res2 != null) {
      firstName.value = res2?['hits']['hits'][0]['_source']['name'];
      data.value = res2?['hits']['hits']
          .map<Widget>((x) => ListTile(
              title: Text('${x["_source"]["name"]}'),
              subtitle: Text(
                  '公司:${x["_source"]["comp"]},工资:${x["_source"]["salary"]}')))
          .toList();
      print(data.value[0].runtimeType);
    } else {
      print("res2 is null");
    }
  }

  @override
  onInit() async {
    super.onInit();
    getData();
  }
}

class HttpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: () => Get.back(),
        //   child: Icon(Icons.arrow_back),
        // ),
        title: GestureDetector(
          onTap: () {
            Get.updateLocale(Locale('en', 'US'));
          },
          child: Text("hello".trArgs(["youht".tr])),
        ),
      ),
      body: Stack(children: [
        Obx(() => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("${c.firstName}")),
            )),
        Center(
          child: Obx(
              () => Container(child: Text("current es name is: ${c.esUuid}"))),
        ),
        Align(
          alignment: Alignment(0.75, -0.75),
          child: Obx(() => Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text("${c.esName}",
                      style: TextStyle(color: Colors.redAccent, fontSize: 40)),
                ),
              )),
        ),
        Obx(() =>
            ListView(padding: EdgeInsets.all(20), children: c.data.value)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: c.getData,
        child: Icon(Icons.account_box),
      ),
    );
  }
}
