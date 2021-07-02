import 'package:http/http.dart';
abstract class Http{
  static const _API = 'https://swapi.dev/api';
  static Client _client = Client();
  
  static Future<Response> get(String endpoint,String query) async{
    final url = _API +endpoint+'?'+query;
    print(url);
    return _client.get(Uri.parse(url));
  }
}