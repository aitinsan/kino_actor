import 'package:http/http.dart' as http;
abstract class Http{
  static const _API = 'https://swapi.dev/api';
  static http.Client _client = http.Client();
  
  static Future<http.Response> get(String endpoint,String query) async{
    final url = _API +endpoint+'?'+query;
    print(url);
    return _client.get(Uri.parse(url));
  }
}