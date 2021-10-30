import 'package:code/task/task_list.dart';
import 'package:flutter/material.dart';

class Dados extends StatelessWidget {
  final List conteudo;

  // recebe os dados da tela anterior (origem)
  Dados({Key key, @required this.conteudo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados do Usuário')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 230,
              color: Colors.white,
            ),
            Text('Id: ' + conteudo[0]),
            Text('Nome: ' + conteudo[1]),
            Text('Email: ' + conteudo[2]),
            Text('Token: ' + conteudo[3]),
            Text('\n'),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tela Anterior'),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            MaterialButton(
              padding: const EdgeInsets.all(20),
              color: Colors.red,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => TaskHome(token: conteudo[3])));
              },
              child: Text('Tela de tarefas'),
            )
          ],
        ),
      ),
    );
  }
}