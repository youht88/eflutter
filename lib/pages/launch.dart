import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../comm/utils.dart';

import 'package:url_launcher/url_launcher.dart';

class Controller extends GetxController {
  var _url = ''.obs;

  var _urlList = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    var _urls = Storage.get("urls");
    if (_urls == null) {
      _urlList.add("http://www.baidu.com");
    } else {
      _urlList.addAll(_urls);
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      onTap: () {
        _url.value = _urlList[index];
        print(_url.value);
      },
      title: Text("${_urlList[index]}"),
    );
  }
}

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  late Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: true,
        enableJavaScript: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    var control = TextEditingController();
    final Controller c = Get.put(Controller());
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.arrow_back),
            ),
            title: Text("launch")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onEditingComplete: () => {c._urlList.add(c._url.value)},
                onChanged: (String text) => c._url.value = text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orangeAccent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  hintText: '输入URL',
                  labelText: "网络地址",
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  suffixIcon: Icon(Icons.clear),
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Colors.orangeAccent,
                  ),
                  helperText: "必须以http，https为前导",
                  helperStyle: TextStyle(color: Colors.grey),
                ),
                controller: control,
                keyboardType: TextInputType.text,
                obscureText: false,
                inputFormatters: [
                  //输入的字符白名单
                  //FilteringTextInputFormatter.allow(RegExp("^http[s]://"))
                ],
                maxLength: 50,
                buildCounter: (BuildContext context,
                    {int? currentLength, bool? isFocused, int? maxLength}) {
                  return Text("$currentLength/$maxLength"); //字符统计
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _launched = _launchInBrowser(c._url.value);
              }),
              child: const Text('查看'),
            ),
            Container(
              height: 500,
              child: Obx(() => ListView.builder(
                  itemCount: c._urlList.length, itemBuilder: c._itemBuilder)),
            ),
            ElevatedButton(
              onPressed: () => Storage.set("urls", c._urlList),
              child: Text('保存列表'),
            ),
            FutureBuilder<void>(future: _launched, builder: _launchStatus),
          ],
        ));
  }
}
