import 'network.dart';

class ICFS {
  final String baseUrl;
  ICFS(this.baseUrl);
  get(String cid) async {
    final url = "$baseUrl/icfs/$cid";
    final response = await HttpClient.get(url);
    print(response);
  }
}
