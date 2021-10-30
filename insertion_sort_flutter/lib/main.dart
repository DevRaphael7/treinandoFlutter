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
        brightness: Brightness.light,
        primaryColor: Colors.red,
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
  var arrayNumeros = [0, 0, 0, 0], aux = 0, atual = 0;
  // num1 = 0, num2 = 0, num3 = 0, num4 = 0;

  final TextEditingController input1 = new TextEditingController();
  final TextEditingController input2 = new TextEditingController();
  final TextEditingController input3 = new TextEditingController();
  final TextEditingController input4 = new TextEditingController();

  void insertionSort(){
    setState((){
      // num1 = int.parse(input1.text);
      // num2 = int.parse(input1.text);
      // num3 = int.parse(input1.text);
      // num4 = int.parse(input1.text);
      arrayNumeros[0] = int.parse(input1.text);
      arrayNumeros[1] = int.parse(input2.text);
      arrayNumeros[2] = int.parse(input3.text);
      arrayNumeros[3] = int.parse(input4.text);

      for(var i = 1;i < arrayNumeros.length;i++){
        var aux2 = i - 1;
        atual = arrayNumeros[i];
        while(aux2 >= 0 && atual < arrayNumeros[aux2]){
          arrayNumeros[aux2 + 1] = arrayNumeros[aux2];
          aux2 --;
        }
        arrayNumeros[aux2 + 1] = atual;
      }
    });
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordenação por Inserção'),
      ),
      body: SingleChildScrollView(
        child: Container( 
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              new Padding(padding: const EdgeInsets.only(top: 25.0)),
              Text('Insira quatro números desordenadamente', style: TextStyle(fontSize: 25.0), textAlign: TextAlign.center),
              new Padding(padding: const EdgeInsets.only(top: 15.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Número 1',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                controller: input1,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Número 2',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                controller: input2,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Número 3',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                controller: input3,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5.0)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Número 4',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                controller: input4,
              ),
              new Padding(padding: const EdgeInsets.only(top: 5.0)),
              RaisedButton(
                child: Text('Ordenar', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                color: Colors.red,
                onPressed: insertionSort,
              ),
              Text('$arrayNumeros', style: TextStyle(fontSize: 34.0),)
            ],
          ),
        ),
      ),
    );
  }
}
