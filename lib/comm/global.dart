import 'package:flutter/material.dart';

var mainBgColor = Colors.deepOrange;
var secBgColor = Colors.purple;
var mainTextColor = Colors.white;
var mainGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [mainBgColor, secBgColor]);
var mainBoxDecoration =
    BoxDecoration(gradient: mainGradient, border: Border.all());
