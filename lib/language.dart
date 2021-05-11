import 'package:get/get.dart';
class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hello': '你好 %s',
          'web':'互联网',
          'youht': '游海涛'
        },
        'en_US': {
          'hello': 'hello %s',
          'web':'WEB',
          'youht':'youht'
        }
      };
}
