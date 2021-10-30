import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override 
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  var minutos = 0, segundos = 0, horas_m = 0.0, horas_s = 0.0;

  final TextEditingController minutos_input = new TextEditingController(text: "0");
  final TextEditingController segundos_input = new TextEditingController(text: "0");

  void converterParaHoras(){

    setState((){
      minutos = int.parse(minutos_input.text);
      segundos = int.parse(segundos_input.text);
      print(minutos);
      if(minutos.isNaN || minutos == null){
        return;
      }else{
        horas_m = (minutos/60);
        horas_m.round();
      }

      if(segundos.isNaN || segundos == null){
        return;
      }else{
        horas_s = (segundos/3600);
        horas_s.round();
      }
    });
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(padding:  const EdgeInsets.only(top: 25.0),),
              Icon(Icons.timer_rounded, color: Colors.yellowAccent, size: 200.0,),
              Padding(padding:  const EdgeInsets.only(top: 15.0),),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                labelText: 'Minutos',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white),
                )),
                controller: minutos_input,
              ),
              Padding(padding:  const EdgeInsets.only(top: 15.0),),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                labelText: 'Segundos', 
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.white),
                )),
                controller: segundos_input,
                ),
                Padding(padding:  const EdgeInsets.only(top: 15.0),),
                Text('Converter', style: TextStyle(
                    fontSize: 30.0, 
                    fontWeight: FontWeight.bold,
                  ),),
                Padding(padding:  const EdgeInsets.only(top: 15.0),),
                Text('minutos'),
                Text('$horas_m Horas', style: TextStyle(
                    fontSize: 30.0, 
                    fontWeight: FontWeight.bold,
                  ),),
                Padding(padding:  const EdgeInsets.only(top: 15.0),),
                Text('segundos'),
                Text('$horas_s Horas', style: TextStyle(
                    fontSize: 30.0, 
                    fontWeight: FontWeight.bold,
                  ),),
                  Padding(padding: const EdgeInsets.only(top: 25.0)),
                  RaisedButton(child: 
                  Text('Converter',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ), 
                    color: Colors.yellowAccent, 
                    onPressed: converterParaHoras
                  ),
            ],
          ),
        ),
      ),
    );
  }
}