import "package:flutter/material.dart";

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: ListView(children: [
          Center(child: Text("Login")),
        ]));
  }
}
