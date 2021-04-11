import 'package:get_storage/get_storage.dart';

class Storage {
  Storage() {
    GetStorage.init();
  }
  static final app = GetStorage();
  static get(String key) => app.read(key);
  static set(String key, value) => app.write(key, value);
}
