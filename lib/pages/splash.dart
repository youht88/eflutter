import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => Get.toNamed('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //color: Colors.white,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepOrange, Colors.purple],
          )),
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 200, bottom: 10),
              child: Container(
                height: 200,
                //width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fj1.jpeg'),
                        fit: BoxFit.fill)),
              ),
            ),
            Text(
              'Flutter 测试',
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ]),
        ),
      ],
    );
  }
}
