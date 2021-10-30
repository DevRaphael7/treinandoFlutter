import 'package:flutter/material.dart';
import 'package:to_do_list_without_api/class/task.dart';
import 'package:to_do_list_without_api/components/list.dart';

class AdicionarNovaTarefa extends StatefulWidget{

  AdicionarNovaTarefa({ this.title });

  final String title;

  @override 
  _AdicionarNovaTarefaState createState() => _AdicionarNovaTarefaState();
}


class _AdicionarNovaTarefaState extends State<AdicionarNovaTarefa>{

  Tasks task = new Tasks();

  final key = GlobalKey<FormState>();
  final avatarUrl = TextEditingController();
  final nomeTarefa = TextEditingController();
  final data = TextEditingController();
  final descricao = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
    body: Form(
      key: key,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextFormField(
              controller: nomeTarefa,
              decoration: const InputDecoration(
                icon: Icon(Icons.task),
                hintText: "Nome da tarefa",
                labelText: "Tarefa"
              ),
              validator: (value) {
                if ( value.isEmpty ){
                  return "Insira um nome para a tarefa!";
                }
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 12.0)),
            TextFormField(
              controller: data,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: "DD/MM/AAAA",
                labelText: "Data"
              ),
              validator: (value) {

                if ( value.isEmpty ){
                  return "Insira uma data válida";
                }

              }
            ),
            const Padding(padding: EdgeInsets.only(bottom: 12.0)),
            TextFormField(
              controller: avatarUrl,
              decoration: const InputDecoration(
                icon: Icon(Icons.image),
                hintText: "URL",
                labelText: "Avatar"
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 12.0)),
            TextFormField(
              controller: descricao,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                icon: Icon(Icons.text_fields),
                hintText: "Descrição",
                labelText: "Descrição"
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 12.0)),
            Container(
              width: double.infinity,
              child: RaisedButton(
                padding: const EdgeInsets.all(20.0),
                color: Colors.blueGrey,
                child: const Text('Adicionar', style: TextStyle(fontSize: 15.0)),
                onPressed: (){

                  //Se caso as validações resultarem em false esse if não vai ser verdadeiro.
                  if (key.currentState.validate()) {
                    setState(() {
                      tarefas.add( new Tasks(avatarUrl: avatarUrl.text, data: data.text, nome: nomeTarefa.text, description: descricao.text) );
                      task.printarLista(tarefas);
                      Navigator.of(context).pop();
                    });
                  }
                }
              )
            ),
          ],
        ),
      ),
    ),
    );
  }
}