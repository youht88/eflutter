import 'package:get/get.dart';

class TestController {
  final _obj = 'abc'.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
