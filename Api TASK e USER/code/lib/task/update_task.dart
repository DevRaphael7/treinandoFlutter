import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AtualizarTask extends StatelessWidget{

  var nome = TextEditingController();
  var id = TextEditingController();
  var realized = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atualizar task"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(
                icon: Icon(Icons.list),
                labelText: "Task",
                hintText: "Nome da sua Task"
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            TextField(
              controller: id,
              decoration: const InputDecoration(
                icon: Icon(Icons.list),
                labelText: "Id",
                hintText: "Id da task"
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            TextField(
              controller: realized,
              decoration: const InputDecoration(
                icon: Icon(Icons.list),
                labelText: "Realized",
                hintText: "realized"
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                _updateTask(id.text, nome.text, realized.text);
              },
              padding: const EdgeInsets.all(20),
              child: const Text("Atualizar task"),
            ),
          ],
        ),
      ),
    );
  }
}

//Código para atualizar a API do Edson.
_updateTask(String id, String name, String realized) async {

  Uri uri = Uri.parse("http://emsapi.esy.es/todolist/api/task/update/");
  var url = await http.put(
    uri,
    headers: {
      "content-type": "application/json",
      "Authorization": "368C63A5DA1562518638"
    },
    body: jsonEncode({
      "id": id,
      "name": name,
      "realized": realized,
    })
  );

  var jsonData = jsonDecode(url.body);

  print(jsonData);

  _getTasks();

}

_getTasks() async {

  Uri url = Uri.parse("http://emsapi.esy.es/todolist/api/task/search/");
  var response = await http.post(
    url,
    headers: {
      "content-type": "application/json",
      "Authorization": "368C63A5DA1562518638"
    }
  );

  print(response);

  var jsonData = await jsonDecode(response.body);

  print(jsonData);
}

exibirDados(String idTask, String realized) {
  if (idTask.isNotEmpty){
    return Text("Id: $idTask\n$realized");
  }
}