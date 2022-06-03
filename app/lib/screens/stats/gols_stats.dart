import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GolsStats extends StatefulWidget {
  const GolsStats({Key key}) : super(key: key);

  @override
  _GolsStats createState() => _GolsStats();
}

class _GolsStats extends State<GolsStats>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Artilheiros'),
      ),
      body: FutureBuilder<List>(
        future: getArtilheiros(),
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

Future<List> getArtilheiros() async {
  var response = await http.get(Uri.parse("https://futliveserver.azurewebsites.net/Stats/artilheiros"));
  if (response.statusCode == 200){
    return jsonDecode(utf8.decode(response.bodyBytes));
  }else{
    throw Exception("Erro");
  }
}