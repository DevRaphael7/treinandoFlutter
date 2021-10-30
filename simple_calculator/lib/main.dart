import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Simples',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lime,
      ),
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget{
  @override 
  State createState() => new PaginaPrincipalState();
}

class PaginaPrincipalState extends State <PaginaPrincipal>{
  var num1 = 0,num2 = 0,resultado = 0;

  final TextEditingController input1 = new TextEditingController();
  final TextEditingController input2 = new TextEditingController();

  void computador(var variavel){
    setState((){
      num1 = int.parse(input1.text);
      num2 = int.parse(input2.text);

      switch(variavel){
        case '+':
          resultado = num1 + num2;
        break;
        case '-':
          resultado = num1 - num2;
        break;
        case '*':
          resultado = num1 * num2;
        break;
        case '/':
          resultado = num1 ~/ num2;
        break;
      }
    });
  }

  void clear(){
    setState(() {
      input1.text = '0';
      input2.text = '0';     
      resultado = 0;
    });
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Container( 
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 30.0)),
              Text('$resultado'),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Número 1',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10.0)
                  ),
                  controller: input1,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Colors.purple,
                    ),
                    ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15.0)),
                Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Número 2',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10.0)
                  ),
                  controller: input2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Colors.purple,
                    ),
                    ),
                ),
                Padding(padding: const EdgeInsets.only(top: 25.0)),
                RaisedButton(
                  child: 
                  Text(
                    '+',
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                  ),
                  color: Colors.lime,
                  hoverColor: Colors.purple,
                  
                  onPressed: (){
                    var variavel = '+';
                    computador(variavel);
                  },
                ),
                Padding(padding: const EdgeInsets.only(top: 10.0)),
                RaisedButton(
                  child: 
                  Text(
                    '-',
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                  ),
                  color: Colors.lime,
                  hoverColor: Colors.purple,
                  
                  onPressed: (){
                    var variavel = '-';
                    computador(variavel);
                  },
                ),
                Padding(padding: const EdgeInsets.only(top: 10.0)),
                RaisedButton(
                  child: 
                  Text(
                    '*',
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                  ),
                  color: Colors.lime,
                  hoverColor: Colors.purple,
                  
                  onPressed: (){
                    var variavel = '*';
                    computador(variavel);
                  },
                ),
                Padding(padding: const EdgeInsets.only(top: 10.0)),
                RaisedButton(
                  child: 
                  Text(
                    '/',
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                  ),
                  color: Colors.lime,
                  hoverColor: Colors.purple,
                  
                  onPressed: (){
                    var variavel = '/';
                    computador(variavel);
                  },
                ),
                Padding(padding: const EdgeInsets.only(top: 20.0)),
                RaisedButton(
                  child: 
                  Text(
                    'Clear',
                    style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)
                  ),
                  color: Colors.lime,
                  hoverColor: Colors.purple,
                  
                  onPressed: clear,
                ),
            ],
          ),
        ),
      ),
    );
  }
}