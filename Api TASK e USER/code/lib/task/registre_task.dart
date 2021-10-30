import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CadastrarTarefas extends StatelessWidget{

  //vai receber o token de outra tela.
  final String token;

  TextEditingController nome = TextEditingController();

  addTaskInAPI( String nome) async {
    Uri url = Uri.parse('http://emsapi.esy.es/todolist/api/task/new/');
    var apiUrl = await http.post(
      url,
      headers: {
        "content-type": "application/json",
        "Authorization": token
      },
      body: jsonEncode({
        "name": nome,
      })
      );

    var jsonData = jsonDecode(apiUrl.body);
    print(jsonData);
    
    if ( apiUrl.statusCode == 200){
      print("Opa, deu certo :)");
    } else {
      print("Opa, deu ruim :(");
    }
  }

  getTasks() async {

    Uri url = Uri.parse('http://emsapi.esy.es/todolist/api/task/search/');
    var urlApi = await http.post(
      url,
      headers: <String, String>{
        "Content-Type": "Application/json; charset=UTF-8",
        "Authorization": "FE800ACCE357E12DAD19"
      },
    );

    var jsonData = jsonDecode(urlApi.body);
    print(jsonData); 
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de tarefas"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(40.0),
          decoration: const BoxDecoration(
            color: Colors.black12
          ),
          child: Column(
            children: [
              const Text("Nome da tarefa ", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),),
              TextField(
                controller: nome,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Task name",
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              MaterialButton(
                padding: const EdgeInsets.all(30.0),
                color: Colors.yellow,
                child: const Text("Enviar a API", style: TextStyle(color: Colors.black),),
                onPressed: () => addTaskInAPI(nome.text)
              )
            ]
          ),
      )
    );
  }

  CadastrarTarefas({this.token});
}