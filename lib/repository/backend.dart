import 'package:kino_actor/constants.dart';
import 'package:kino_actor/models/people.dart';
import 'package:http/http.dart' as http;
import 'package:kino_actor/models/responce.dart';


//функция проверяет есть ли следующая страница
Future<List<People>> fetchPeople(http.Client client, int pageIndex) async {
  return await ResponseClass('$ALL_PEOPLE_PAGE$pageIndex',client).someListOfPeople;}

//для того чтобы достать людей с пейджа
Future<bool> fetcNext(http.Client client, int pageIndex) async {
  return  await ResponseClass('$ALL_PEOPLE_PAGE$pageIndex',client).isNextExist;}






//функция проверяет есть ли следующая страница
/*Future<bool> fetcNext(http.Client client, int pageIndex) async{
  final response = await client.get(Uri.parse('https://swapi.dev/api/people/?page=$pageIndex'),);
  final nextOrNull = Pagination.fromJson(jsonDecode(response.body),).next;
  print(nextOrNull);
  if (nextOrNull != null){
    return true;
  }
  else return false;
  
  
}


//для того чтобы достать людей с пейджа
Future<List<People>> fetchPeople(http.Client client, int pageIndex) async {
  final response = await client.get(
    Uri.parse('https://swapi.dev/api/people/?page=$pageIndex'),
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    },
  );

  final result = Pagination.fromJson(
    jsonDecode(response.body),
  ).results;

  return result;
}

*/