import 'package:eflutter/comm/utils.dart';
import 'package:eflutter/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var a = 10;
}

Widget image = Expanded(
    child: Container(
        //decoration: BoxDecoration(
        //border: Border.all(),
        //borderRadius: BorderRadius.only(
        //    topLeft: Radius.circular(150),
        //    topRight: Radius.circular(150))),
        child: Image.asset(
  "assets/images/fj1.jpeg",
  fit: BoxFit.cover,
)));
Widget detail = Container(
    width: 250,
    margin: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Strawberry Pavlova",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                )),
            Text(
              "Pavlova is meringue-based desert named after the Rassian ballerina Anna Pavlova.Pavlova features a crisp crust and soft,light inside,topped whth fruit and whipped cream.",
              maxLines: 5,
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
              Text("170 Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.book, color: Colors.greenAccent),
                    Text("PREP:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("25 min",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_clock),
                    Text("COOK:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("1 hr", style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.food_bank_sharp),
                    Text("FEEDS:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("4-6 ", style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ));

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    print(Storage.get("keys"));
    print(GetPlatform.isMobile);
    //Get.put(LoginController());
    return Scaffold(
=======
     print(Storage.get("keys"));
     print(GetPlatform.isMobile);
     SplashController kkk = Get.put(SplashController());
     return Scaffold(
>>>>>>> 1f4e5c2c95049beb2fc8e4e7a2fcae99e452a81d
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Column(
            children: [
              GestureDetector(child: Text('hello'.trArgs(["youht".tr]))),
              Text("${kkk.a}")
            ],
          ),
        ),
        body: body(context, detail, image));
  }
}

Function body = (BuildContext context, Widget detail, Widget image) {
  print("??,${GetPlatform.isDesktop}");
  if (GetPlatform.isMobile && context.isPortrait) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [detail, image]);
  } else if (GetPlatform.isMobile) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [detail, image]);
  } else if (GetPlatform.isDesktop || GetPlatform.isWeb) {
    print("isDesktop,${Get.size.width}");
    if (Get.size.width > 768) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [detail, image]);
    } else {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [detail, image]);
    }
  }
};
