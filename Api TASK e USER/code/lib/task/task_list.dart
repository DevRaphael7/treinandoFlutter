import 'package:code/class/api.dart';
import 'package:code/class/task.dart';
import 'package:code/task/detail_task.dart';
import 'package:code/task/registre_task.dart';
import 'package:code/task/update_task.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskHome extends StatefulWidget{

  final String token;

  TaskHome({this.token});

  @override
  _TaskHomeState createState() => _TaskHomeState(token: token);
}

class _TaskHomeState extends State<TaskHome>{

  final String token;

  var tasks = [];

  _getTasks() {
    API.getTasks(token).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        tasks = lista.map((model) => Task.fromJson(model)).toList();
        print(tasks);
      });
    });
  }

  _TaskHomeState({this.token}){
    _getTasks();
  }

  @override
  Widget build(BuildContext context){
      return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => CadastrarTarefas(token: token,) )), icon: Icon(Icons.add))
            ],
            title: const Text("Lista de tarefas"),
          ),
          body: listaTarefas()
      );
  }

  // constrói a lista, ou seja, o Widget
  listaTarefas(){
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: const NetworkImage(
              "https://1.bp.blogspot.com/-5EO0HbOxVpQ/Xfbqz7fdmRI/AAAAAAAAES4/0-SYrJ7CF4Az9qtArJnfQ_0nLTDUaxD0QCLcBGAsYHQ/s1600/PAPEIS%2BDE%2BPAREDE%2B-%2BPAPEL%2BDE%2BPAREDE%2BANIME%2BART%2B-%2BBEST%2BANIMES%2BPAPEL%2BDE%2BPAREDE%2BANIMES%2BANIMES%2BWALLPAPERS.jpg",
            ),
            backgroundColor: Colors.blueAccent[300],
          ),
          title: Text(
            tasks[index].name,
            style: const TextStyle(fontSize: 20.0, color: Colors.black),),
            subtitle: Text(tasks[index].date),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage("https://1.bp.blogspot.com/-5EO0HbOxVpQ/Xfbqz7fdmRI/AAAAAAAAES4/0-SYrJ7CF4Az9qtArJnfQ_0nLTDUaxD0QCLcBGAsYHQ/s1600/PAPEIS%2BDE%2BPAREDE%2B-%2BPAPEL%2BDE%2BPAREDE%2BANIME%2BART%2B-%2BBEST%2BANIMES%2BPAPEL%2BDE%2BPAREDE%2BANIMES%2BANIMES%2BWALLPAPERS.jpg", tasks[index].name, tasks[index].date, tasks[index].id, tasks[index].userId)));
            },
            trailing: Container( //Esse container é necessário se não vai ter erro.
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AtualizarTask())), 
                    icon: const Icon(Icons.edit, color: Colors.yellow),
                  ),
                  IconButton(
                    onPressed: () => _deleteTask(token, tasks[index].id.toString()),
                    icon: const Icon(Icons.delete, color: Colors.red),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}

_deleteTask(String token, String id) async {

  Uri uri = Uri.parse("http://emsapi.esy.es/todolist/api/task/delete/");
  var response = await http.delete(
    uri,
    headers: {
      "content-type": "application/json",
      "Authorization": token
    },
    body: jsonEncode({
      "id": id
    })
  );

  var jsonData = jsonDecode(response.body);
  print(jsonData);
}