import 'package:get/get.dart';

import '../pages/home.dart';
import '../pages/config.dart';
import '../pages/login.dart';
import '../pages/notfind.dart';
import '../pages/webview.dart';

class MyRoutes {
  static final initialRoute = "/home";
  static final List<GetPage> routes = [
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/login", page: () => Login()),
    GetPage(name: "/config", page: () => Config()),
    GetPage(name: "/webview", page: () => Webview())
  ];
  static final unknowRoute = GetPage(name: "/unknow", page: () => Unknow());
}
