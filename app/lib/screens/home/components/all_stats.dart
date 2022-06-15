import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/screens/stats/details_stats.dart';

class AllStats extends StatefulWidget {
  const AllStats({Key key}) : super(key: key);

  @override
  _AllStats createState() => _AllStats();
}

class _AllStats extends State<AllStats>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Todas estatísticas'),
      ),
      body: _buildItem(),
    );
  }
}

ListView _buildItem() {
  var listItems = [{"nome":"Gols","endpoint":"https://futliveserver.azurewebsites.net/Stats/artilheiros"},{"nome":"Assistências","endpoint":"https://futliveserver.azurewebsites.net/Stats/garçons"},{"nome":"Desarmes","endpoint":"https://futliveserver.azurewebsites.net/Stats/desarmes"},{"nome":"Defesa","endpoint":"https://futliveserver.azurewebsites.net/Stats/defesas"},{"nome":"Sem sofrer gol","endpoint":"https://futliveserver.azurewebsites.net/Stats/saldo_gol"},{"nome":"Faltas sofridas","endpoint":"https://futliveserver.azurewebsites.net/Stats/falta_sofrida"},{"nome":"Finalização para fora","endpoint":"https://futliveserver.azurewebsites.net/Stats/finalizacao_fora"},{"nome":"Finalização defendida","endpoint":"https://futliveserver.azurewebsites.net/Stats/finalizacao_defendida"},{"nome":"Finalização na trave","endpoint":"https://futliveserver.azurewebsites.net/Stats/finalizacao_trave"},{"nome":"Pênalti sofrido","endpoint":"https://futliveserver.azurewebsites.net/Stats/penalti_sofrido"},{"nome":"Defesa de pênalti","endpoint":"https://futliveserver.azurewebsites.net/Stats/defesa_penalti"},{"nome":"Gol contra","endpoint":"https://futliveserver.azurewebsites.net/Stats/gol_contra"},{"nome":"Cartão vermelho","endpoint":"https://futliveserver.azurewebsites.net/Stats/cartao_vermelho"},{"nome":"Cartão amarelo","endpoint":"https://futliveserver.azurewebsites.net/Stats/cartao_amarelo"},{"nome":"Gol sofrido","endpoint":"https://futliveserver.azurewebsites.net/Stats/gol_sofrido"},{"nome":"Pênalti perdido","endpoint":"https://futliveserver.azurewebsites.net/Stats/penalti_perdido"},{"nome":"Pênalti cometido","endpoint":"https://futliveserver.azurewebsites.net/Stats/penalti_cometido"},{"nome":"Falta cometida","endpoint":"https://futliveserver.azurewebsites.net/Stats/falta_cometida"},{"nome":"Impedimento","endpoint":"https://futliveserver.azurewebsites.net/Stats/impedimento"},{"nome":"Passe incompleto","endpoint":"https://futliveserver.azurewebsites.net/Stats/passe_incompleto"}];
  return ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.query_stats),
        title: Text(listItems[index]['nome']),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsStats(nome: listItems[index]['nome'], endpoint: listItems[index]['endpoint'])));
        },
      );
    }
  );
}