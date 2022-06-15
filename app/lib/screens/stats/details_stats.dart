import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsStats extends StatefulWidget {
  final String nome, endpoint;
  const DetailsStats({Key key, this.nome, this.endpoint}) : super(key: key);

  @override
  _DetailsStats createState() => _DetailsStats();
}

class _DetailsStats extends State<DetailsStats>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(widget.nome),
      ),
      body: FutureBuilder<List>(
        future: getStats(widget.endpoint),
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
                title: Text(snapshot.data[i]['nome']),
                subtitle: Text(snapshot.data[i]['quantidade'].toString()),
                trailing: Text('Jogos: '+ snapshot.data[i]['jogos'].toString()),
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

Future<List> getStats(String endpoint) async {
  var response = await http.get(Uri.parse(endpoint));
  if (response.statusCode == 200){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }else{
    throw Exception("Erro");
  }
}