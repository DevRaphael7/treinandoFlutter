import 'package:code/class/pessoa.dart';
import 'package:code/user/atualizar_user.dart';
import 'package:code/user/dados.dart';
import 'package:code/user/registre_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<UserHome> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  //  Variáveis do ambiente que receberão os dados da API
  int _id = 0;
  String _nome = '';
  String _email = '';
  String _mensagem = '';
  String _token = '';

  // Documentação da API
  // https://github.com/EdsonMSouza/php-api-to-do-list

  // Endereço da API
  Uri url = Uri.parse('http://emsapi.esy.es/todolist/api/user/login/');

  // Método para requisição da API
  jsonRestApiHttp() async {
    // esse bloco de código envia a requisição ao servidor da API
    http.Response response = await http.post(
      this.url,
      headers: <String, String>{
        "Content-Type": "Application/json; charset=UTF-8"
      },
      body: jsonEncode(<String, String>{
        "username": usuarioController.text,
        "password": senhaController.text,
      }),
    );

    print(response.body);

    // Bloco que recupera a informação do servidor e converte JSON para objeto
    final parsed = json.decode(response.body);
    var pessoa = Pessoa.fromJson(parsed);

    // Vamos mostrar os dados na tela do APP, tratando os erros
    try {
      if (pessoa.id > 0) {
        // deu bom, achou dados na API
        usuarioController.text = '';
        senhaController.text = '';
        setState(() {
          _id = pessoa.id;
          _nome = pessoa.nome;
          _email = pessoa.email;
          _token = pessoa.token;
          _mensagem = '';

          // envia os dados após recuperar da API (se deu certo)
          _enviarDadosOutraTela(context);
        });
      }
    } catch (e) {
      // se não retornou dados (id, nome, email)
      usuarioController.text = '';
      senhaController.text = '';
      setState(() {
        _id = 0;
        _nome = '';
        _email = '';
        _token = '';
        _mensagem = pessoa.message;
        // if (_mensagem == 'Incorrect username and/or password') {
        //   _mensagem = 'Usuário e/ou senha incorretos';
        // }
        print(_mensagem);
      });
    }
  }

  // método para enviar dados para outra tela (view)
  void _enviarDadosOutraTela(BuildContext context) {
    // variável para armazenar os dados que queremos passar à outra tela
    List conteudo = <String>[_id.toString(), _nome, _email, _token];

    // enviar os dados efetivamente, ou seja, abrir a outra tela
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dados(conteudo: conteudo),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegação entre Telas'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Campo usuário
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: usuarioController,
                  decoration: InputDecoration(labelText: "Usuário"),
                ),
              ),

              // Campo senha
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: TextFormField(
                  controller: senhaController,
                  decoration: InputDecoration(labelText: "Senha"),
                ),
              ),

              // Login
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 50.0,
                  child: RawMaterialButton(
                    onPressed: () {
                      jsonRestApiHttp();
                    },
                    child: Text('Login'),
                  ),
                ),
              ),

              // mostra a mensagem de erro da API
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 50.0,
                  child: Text(
                    _mensagem,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Botão para cadastrar
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 50.0,
                  color: Colors.green,
                    child: MaterialButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => Cadastrar()),
                      ),
                      child: Text("Cadastrar"),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 50.0,
                  color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => AtualizarUser()),
                      ),
                      child: Text("Atualizar usuário"),
                    )
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}