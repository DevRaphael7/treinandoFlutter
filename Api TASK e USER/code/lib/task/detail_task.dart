import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{

  final String img;
  final String nome;
  final int id;
  final String date;
  final int userId;

  @override
  Widget build(BuildContext context){
    return Scaffold(
          appBar: AppBar(
            title: const Text("Lista de tarefas"),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all( Radius.circular(500.0) )
                        ),
                        child: Image.network(img, fit: BoxFit.cover),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text("Nome: ${this.nome}", style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400, color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text("Data: ${this.date}", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200, color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text("ID: ${this.id.toString()}", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200, color: Colors.white)),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text("UserId: ${this.userId.toString()}", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200, color: Colors.white)),
                    ]
            )
          )
      );
  }
  DetailPage(this.img, this.nome, this.date, this.id, this.userId);
}