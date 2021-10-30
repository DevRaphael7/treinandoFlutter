import 'package:flutter/material.dart';


class DetailPage extends StatefulWidget{
  DetailPage( { this.title="", this.avatarUrl="", this.name="", this.date, this.description=""} );

  final String title;
  final String avatarUrl;
  final String name;
  final String date;
  final String description;
  
  @override 
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.center, child: _imagemDoAvatar(widget.avatarUrl)),
            Text("Nome: ${widget.name}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
            Text("Data: ${widget.date}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
            const Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.white,
            ),
            const Text("Descrição: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(widget.description == "" ? "Sem descrição" : widget.description, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}

_imagemDoAvatar(String avatarUrl) {
  if ( avatarUrl.isNotEmpty ){
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular( 20 ),
        image: DecorationImage(
          image: NetworkImage(avatarUrl)
        )  
      )
    );
  }

  return const Icon(
    Icons.person_pin,
    color: Colors.white,
    size: 120, 
  );
}