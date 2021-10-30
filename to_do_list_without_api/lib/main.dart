import 'package:flutter/material.dart';
import 'package:to_do_list_without_api/add_task.dart';
import 'package:to_do_list_without_api/class/task.dart';
import 'package:to_do_list_without_api/components/list.dart';
import 'package:to_do_list_without_api/detail_task.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({ this.title });

  final String title;

  @override 
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{

  @override 
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => AdicionarNovaTarefa(title: "Adicionar tarefa",)))
          ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, int index) {
            return listaDeTarefas(context, index, tarefas);
          }, 
          separatorBuilder: (context, _) => const Padding(padding: EdgeInsets.only(bottom: 15.0)), 
          itemCount: tarefas.length
        )
      )
    );  
  }
}

Widget listaDeTarefas(BuildContext context, int index, List<Tasks> tarefasAFazer) {
  return ListTile(
    leading: tarefasAFazer[index].avatarUrl.isEmpty ? Icon(Icons.person) : CircleAvatar(backgroundImage: NetworkImage(tarefasAFazer[index].avatarUrl)),
    title: Text(tarefasAFazer[index].nome, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
    subtitle: Text(tarefasAFazer[index].data),
    onTap: () {
      Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage(avatarUrl: tarefasAFazer[index].avatarUrl, title: "Tarefa", name: tarefasAFazer[index].nome, date: tarefasAFazer[index].data, description: tarefasAFazer[index].description)));
    },
  );
}