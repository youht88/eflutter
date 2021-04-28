import 'package:get_storage/get_storage.dart';

class Storage {
  Storage() {
    GetStorage.init();
  }
  static final box = GetStorage();
  static get(String key) => box.read(key);
  static set(String key, value) => box.write(key, value);
}
