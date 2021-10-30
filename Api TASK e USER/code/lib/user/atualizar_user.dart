import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AtualizarUser extends StatefulWidget{

  @override
  _AtualizarUsuarioState createState() => new _AtualizarUsuarioState();
}

class _AtualizarUsuarioState extends State<AtualizarUser>{

  updateUser(String nome, String email, String username, String password) async{
    print("Usuário: $username");
    Uri uri = Uri.parse("http://emsapi.esy.es/todolist/api/user/update/");
    var response = await http.put(
      uri,
      headers: {
        "content-type": "application/json",
        "Authorization": "FE800ACCE357E12DAD19"
      },
      body: jsonEncode({
        "name": nome,
        "email": email,
        "username": username,
        "password": password
        //"159357" Minha senha nesta API
      })
      );
    
    var jsonData = jsonDecode(response.body);

    print("Resposta da API: $jsonData");
    //Esse print é só para ver se deu certo a requisição
    print(response);
  }

  TextEditingController nome = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("UPDTATE user API", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),),
              TextField(
                controller: nome,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Seu nome completo",
                  labelText: "Nome"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Seu email",
                  labelText: "E-mail"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Seu usuário",
                  labelText: "Username"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Sua senha",
                  labelText: "Password"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              MaterialButton(
                padding: const EdgeInsets.all(30.0),
                color: Colors.yellow,
                child: const Text("Enviar a API", style: TextStyle(color: Colors.black),),
                onPressed: () => updateUser(nome.text, email.text, username.text, password.text)
              )
          ],
        ),
      )
    );
  }
}