import 'package:http/http.dart' as http;

Uri url = Uri.parse('http://emsapi.esy.es/todolist/api/task/search/');


class API{
  static Future getTasks(String token) async {
    return  await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "Application/json; charset=UTF-8",
        "Authorization": token
      },
    ); 
  }
}