import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'card_controll.dart';

class CardView extends GetView<CardController> {
  @override
  Widget build(BuildContext contenx) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("card")),
    );
  }
}
