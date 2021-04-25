import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../comm/utils.dart';

class Controller extends GetxController {
  var esName = ''.obs;
  var esUuid = ''.obs;
  var firstName = ''.obs;
  var userData = {}.obs;
  void getData() async {
    final res1 = await HttpClient.get("http://youht.cc:18083/es/");
    final res2 =
        await HttpClient.post("http://youht.cc:18083/es/qjzid2/_search", body: {
      "query": {
        "match": {"name": "张"}
      }
    });
    print(res2);
    esName.value = res1['name'];
    esUuid.value = res1['cluster_uuid'];
    firstName.value = res2['hits']['hits'][0]['_source']['name'];
    userData = res2['hits']['hits']
        .map((x) => {
              "id": x["_source"]["id"],
              "name": x["_source"]["name"],
              "sex": x["_source"]["sex"],
              "salary": x["_source"]["salary"],
              "comp": x["_source"]["comp"],
            })
        .toList();
    // List userView = userData
    //     .map((x) => ListTile(title: x["name"], subtitle: x["comp"]))
    //     .toList();
  }
}

class HttpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back),
        ),
        title: Text("HTTP"),
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
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: c.getData,
        child: Icon(Icons.account_box),
      ),
    );
  }
}
