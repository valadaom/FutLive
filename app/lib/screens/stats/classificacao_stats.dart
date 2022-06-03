import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClassificacaoStats extends StatefulWidget {
  const ClassificacaoStats({Key key}) : super(key: key);

  @override
  _ClassificacaoStats createState() => _ClassificacaoStats();
}

class _ClassificacaoStats extends State<ClassificacaoStats>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Classificação'),
      ),
      body: FutureBuilder<List>(
        future: getClassificacao(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Center(
              child: Text('Erro'),
            );
          }
          if (snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i){
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(snapshot.data[i]['clube_image']),
                ),
                title: Text(snapshot.data[i]['clube_nome']),
                trailing: SizedBox(
                  width: 50,
                  child: Text((snapshot.data[i]['clube_posicao'].toString()),
                    style: Theme.of(context).textTheme.headline6,
                )),
              );
            });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future<List> getClassificacao() async {
  var response = await http.get(Uri.parse("https://futliveserver.azurewebsites.net/Stats/classificacao"));
  if (response.statusCode == 200){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }else{
    throw Exception("Erro");
  }
}