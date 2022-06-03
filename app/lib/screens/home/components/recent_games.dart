import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/bet_screen.dart';

import '../../../constants.dart';

class RecentGames extends StatelessWidget {
  const RecentGames({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: getLastGames(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        final recentGames = <Widget>[];
        if (snapshot.hasData){
          for (var i =0; i < 4; i++){
            recentGames.add(new RecomendsGamesCard(
              time_casa_foto: snapshot.data['partidas'][i]['time_casa_foto'],
              time_fora_foto: snapshot.data['partidas'][i]['time_fora_foto'],
              time_casa_nome: snapshot.data['partidas'][i]['time_casa_nome'],
              time_fora_nome: snapshot.data['partidas'][i]['time_fora_nome'],
              time_casa_resultado: snapshot.data['partidas'][i]['time_casa_resultado'],
              time_fora_resultado: snapshot.data['partidas'][i]['time_fora_resultado'],
              press: () {},
            ));
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: recentGames
            ),
          );
        }
        else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class RecomendsGamesCard extends StatelessWidget {
  const RecomendsGamesCard({
    Key key,
    this.time_casa_foto,
    this.time_casa_nome,
    this.time_casa_resultado,
    this.time_fora_foto,
    this.time_fora_nome,
    this.time_fora_resultado,
    this.press,
  }) : super(key: key);

  final String time_casa_foto,time_casa_nome, time_fora_foto, time_fora_nome;
  final time_casa_resultado,time_fora_resultado;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Row(
              children: [
                Image.network(time_casa_foto),
                Image.asset("assets/images/x-image.png"),
                Image.network(time_fora_foto)
              ],),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: time_casa_nome.toUpperCase() + ' - ' + time_casa_resultado+'\n', style: Theme.of(context).textTheme.button),
                        TextSpan(text: time_fora_nome.toUpperCase() + ' - ' + time_fora_resultado+'\n', style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
Future <dynamic> getLastGames() async {
  final response = await http.get(
      Uri.parse('https://futliveserver.azurewebsites.net/Rodada/lastgames'),
      headers: <String, String>{
        'Content-Type': 'application/json'
      }
  );
  final data = json.decode(response.body);
  return data;
}
//modificado