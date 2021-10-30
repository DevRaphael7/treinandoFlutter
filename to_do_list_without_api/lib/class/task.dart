import 'dart:html';

import 'package:to_do_list_without_api/components/list.dart';

class Tasks{

  String avatarUrl;
  String nome;
  String data;
  String description;

  void printarLista(List<Tasks> tarefas){

    for (int i = 0; i < tarefas.length; i++) {
      print(tarefas[i].nome);
    }
  }

  bool validarData(String data){

    if ( data.isEmpty ) return false;

    List<String> dataList = data.split("/");

    int tamanho = dataList.length;

    if ( tamanho != 3 ){
      return false;
    }

    if ( dataList[0].length > 2 || dataList[1].length > 2 || ( dataList[3].length > 4 || dataList[3].length < 4)){
      return false;
    }

    int dia, mes, ano;

    try {
      int dia = int.parse(dataList[0]);
      int mes = int.parse(dataList[1]);
      int ano = int.parse(dataList[2]);

      if ( dia > 31 ) return false;
      else if (mes > 12 ) return false;

    } catch (Exeception) {
      return false;
    }

    return true;
  }

  Tasks( {this.avatarUrl, this.nome, this.data, this.description} );
}