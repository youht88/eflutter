import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var count = 0.obs;
  add() => count++;
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Login"),
        ),
        body: Center(
          child: Container(child: Text("hello world!!")),
        ));
  }
}
