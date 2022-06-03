import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/screens/details/bet_screen.dart';

class AllNextGames extends StatefulWidget {
  const AllNextGames({Key key}) : super(key: key);

  @override
  _AllNextGames createState() => _AllNextGames();
}

class _AllNextGames extends State<AllNextGames>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Próximos jogos'),
      ),
      body: FutureBuilder<List>(
        future: getNextGames(),
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
                  backgroundImage: NetworkImage(snapshot.data[i]['time_casa_foto'])
                ),
                title: Text('     '+snapshot.data[i]['time_casa_nome'] + '  ' +snapshot.data[i]['time_casa_resultado'] + ' X ' + snapshot.data[i]['time_fora_resultado'] + '  '+ snapshot.data[i]['time_fora_nome']+ '\n' + '     '+snapshot.data[i]['partida_data']),
                trailing: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(snapshot.data[i]['time_fora_foto'])
                ),
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


Future<List> getNextGames() async {
  var response = await http.get(Uri.parse("https://futliveserver.azurewebsites.net/Rodada/nextgames"));
  if (response.statusCode == 200){
    return jsonDecode(utf8.decode(response.bodyBytes))['partidas'];
  }else{
    throw Exception("Erro");
  }
}