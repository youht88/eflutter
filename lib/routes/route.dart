import 'package:get/get.dart';

import '../pages/home.dart';
import '../pages/config.dart';
import '../pages/login.dart';
import '../pages/notfind.dart';
import '../pages/webview.dart';
import '../pages/echart.dart';
import '../pages/flchart.dart';
import '../pages/http.dart';
import '../pages/frosted.dart';
import '../pages/path.dart';
import '../pages/launch.dart';
import '../pages/qrscan.dart';
import '../pages/animate.dart';
import '../pages/audio.dart';

class MyRoutes {
  static final initialPath = "/home";
  static final List<GetPage> routes = [
    GetPage(name: "/home", page: () => Home()),
    GetPage(name: "/login", page: () => Login()),
    GetPage(name: "/config", page: () => Config()),
    GetPage(name: "/webview", page: () => Webview()),
    GetPage(name: "/echart", page: () => EchartView()),
    GetPage(name: "/flchart", page: () => FlchartView()),
    GetPage(name: "/http", page: () => HttpView()),
    GetPage(name: "/frosted", page: () => FrostedView()),
    GetPage(name: "/path", page: () => PathDemo()),
    GetPage(name: "/launch", page: () => Launch()),
    GetPage(name: "/qrscan", page: () => Qrscan()),
    GetPage(name: "/animate", page: () => Animate()),
    GetPage(name: "/audio", page: () => AudioView()),
  ];
  static final unknowRoute = GetPage(name: "/unknow", page: () => Unknow());
}
