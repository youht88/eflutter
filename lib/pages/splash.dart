import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashController extends GetxController {
  var a = "SplashController".obs;
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () => Get.toNamed('/home'));
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
            colors: [Colors.blueAccent, Colors.blueAccent.withOpacity(0.5)],
          )),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Padding(
                //   padding: EdgeInsets.only(top: 200, bottom: 10),
                //   child: Container(
                //     height: 200,
                //     //width: 200,
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             image: AssetImage('assets/images/fj1.jpeg'),
                //             fit: BoxFit.fill)),
                //   ),
                // ),
                Expanded(
                  child: SvgPicture.asset(
                    'assets/images/undraw_Development_re_g5hq.svg',
                    //color: Colors.yellow[100],
                    //fit: BoxFit.cover,
                    placeholderBuilder: (context) => Text("wait..."),
                    //height: 200,
                    //width: 200,
                  ),
                )
              ]),
        ),
      ],
    );
  }
}
