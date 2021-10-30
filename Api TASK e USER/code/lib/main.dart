import 'package:code/task/task_list.dart';
import 'package:code/user/home_user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomePage(title: 'Tela principal'),
    );
  }
}

class HomePage extends StatefulWidget{
  HomePage({ this.title = "" });

  final String title;

  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [

                MaterialButton(
                  padding: EdgeInsets.all(60),
                  color: Colors.red,
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserHome())),
                  child: const Text("Tela de login", style: TextStyle(color: Colors.white, fontSize: 30),),
                ),

              ],
            ),
      )
    );
  }
}
