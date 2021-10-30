import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cadastrar extends StatelessWidget{

  postNewUserApi( {String nome = "Raphael Ramalho dos Santos", String username = "DevRaphael7", String email = "sóteste@email.com", String password = "159357"}) async{

    Uri uri = Uri.parse("http://emsapi.esy.es/todolist/api/user/new/");
    var response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": nome,
        "email": email,
        "username": username,
        "password": password
      })
    );

    var jsonData = jsonDecode(response.body);

    print(jsonData);
    //FE800ACCE357E12DAD19 ==> MEU TOKEN
    
    if(response.statusCode == 200){
      print("Opa, deu certo :)\n\n$response");
    } else {
      print("Deu td errado :(");
    }
  }




  TextEditingController nome = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("NEW user API", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),),
              TextField(
                controller: nome,
                //Coloca decoração nos campos de textos
                decoration: const InputDecoration(
                  prefix: Icon(Icons.person),
                  contentPadding: EdgeInsets.only(left: 2.5),
                  hintText: "Seu nome completo",
                  labelText: "Your name"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.email),
                  hintText: "Seu email completo",
                  labelText: "Your email"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.person),
                  hintText: "Seu usuário",
                  labelText: "Your username"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              TextField(
                controller: password,
                decoration: const InputDecoration(
                  prefix: Icon(Icons.lock),
                  hintText: "Sua senha",
                  labelText: "Your password"
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50.0)),
              MaterialButton(
                padding: const EdgeInsets.all(30.0),
                color: Colors.yellow,
                child: const Text("Enviar a API", style: TextStyle(color: Colors.black),),
                onPressed: () => postNewUserApi(nome: nome.text, password: password.text, email: email.text, username: username.text)
              )
          ],
        ),
      )
    );
  }
}