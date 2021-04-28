import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../comm/utils.dart';

import 'package:url_launcher/url_launcher.dart';

class Controller extends GetxController {
  var _url = 'https://www.baidu.com'.obs;
}

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  Future<void> _launched;

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

  Widget itemBuilder(
      BuildContext context, int index, Animation<double> animate) {}

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
                  onEditingComplete: () => {print("complete")},
                  onChanged: (String text) => c._url.value = text,
                  decoration: const InputDecoration(hintText: '输入URL')),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _launched = _launchInBrowser(c._url.value);
              }),
              child: const Text('查看'),
            ),
            FutureBuilder<void>(future: _launched, builder: _launchStatus),
            AnimatedList(itemBuilder: itemBuilder)
          ],
        ));
  }
}
