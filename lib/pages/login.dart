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
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 300,
              height: 500,
              child: Column(
                children: [
                  Center(
                    child: Text("登录"),
                  ),
                  SizedBox(height: 8),
                  Row(
                      textDirection: TextDirection.ltr,
                      children: [Text("用户名"), TextField()]),
                  SizedBox(height: 8),
                  TextField(
                    decoration:
                        InputDecoration(icon: Icon(Icons.ac_unit_sharp)),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
