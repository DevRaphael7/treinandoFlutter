import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget{
  @override 
  State createState() => new PaginaPrincipalState();
}
class PaginaPrincipalState extends State<PaginaPrincipal>{
  var user = '', mensagem_usuario = '', mensagem_password = "", 
    mensagem_sucesso = '';
  var senha = 0;

  final TextEditingController input1 = new TextEditingController();
  final TextEditingController input2 = new TextEditingController();

  void validarForm(){
    setState(() {
        user = input1.text;
        senha = int.parse(input2.text);

        
        if(user.length < 6 || user.isEmpty){
          mensagem_usuario = 'O usuário deve ter pelo menos seis caracteres!';
        }else{
          mensagem_usuario = '';
        }

        if(senha.toString().length < 8){
          mensagem_password = 'Senha deve possuir pelo menos 8 caracteres';
        }else{
          mensagem_password = '';
        }

        if(senha.toString().length >= 8 && user.length >= 6){
          mensagem_sucesso = 'Login feito com sucesso!';
        } 
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 50.0)),
              Icon(
                Icons.person,
                size: 220.0,
              ),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  icon: Icon(Icons.person, size: 50.0,),
                ),
                controller: input1,
              ),
              Text('$mensagem_usuario'),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  icon: Icon(Icons.shield, size: 50.0,),
                ),
                controller: input2,
              ),
              Text('$mensagem_password'),
              Padding(padding: const EdgeInsets.only(top: 50.0)),
              MaterialButton(
                onPressed: validarForm,
                child: Text('Login', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
              ),
              Padding(padding: const EdgeInsets.only(top: 25.0)),
              Text('$mensagem_sucesso', style: TextStyle(color: Colors.green, fontSize: 25.0),),
            ],
          )
        ),
      ),
    );
  }
}