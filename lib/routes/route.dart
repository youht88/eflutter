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
import '../pages/splash.dart';
import '../pages/cryptoDemo.dart';
import '../pages/card/card.dart';

class MyRoutes {
  static final initialPath = "/splash";
  static final List<GetPage> routes = [
    GetPage(name: "/splash", page: () => SplashPage()),
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
    GetPage(name: "/crypto", page: () => CryptoPage()),
    GetPage(name: "/card", page: () => CardView())
  ];
  static final unknowRoute = GetPage(name: "/unknow", page: () => Unknow());
}
