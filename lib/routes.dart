import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/graph.dart';
import 'pages/fl.dart';

class MyRoute {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/home": (_) => Home(),
    "/login": (_) => Login(),
    "/graph": (_) => Graph(),
    "/fl": (_) => FlHome(),
  };
}
