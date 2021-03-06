import 'package:flutter/material.dart';
import 'package:plant_app/screens/stats/details_stats.dart';
import 'package:plant_app/screens/stats/classificacao_stats.dart';

import '../../../constants.dart';

class StatsMain extends StatelessWidget {
  const StatsMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          StatsCard(
            image: "assets/images/separator.png",
            text: "Classificação",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassificacaoStats(),
                ),
              );
            },
          ),StatsCard(
            image: "assets/images/separator.png",
            text: "Gols",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsStats(nome: "Gols", endpoint: "https://futliveserver.azurewebsites.net/Stats/artilheiros"),
                ),
              );
            },
          ),
          StatsCard(
            image: "assets/images/separator.png",
            text: "Assistências",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsStats(nome: "Assistências", endpoint: "https://futliveserver.azurewebsites.net/Stats/garçons"),
                ),
              );
            },
          ),
          StatsCard(
            image: "assets/images/separator.png",
            text: "Defesas",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsStats(nome: "Defesas", endpoint: "https://futliveserver.azurewebsites.net/Stats/defesas"),
                ),
              );
            },
          ),
          StatsCard(
            image: "assets/images/separator.png",
            text: "Desarmes",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsStats(nome: "Desarmes", endpoint: "https://futliveserver.azurewebsites.net/Stats/desarmes"),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key key,
    this.image,
    this.text,
    this.press,
  }) : super(key: key);
  final String image, text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.4,
        height: 45,
          child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: text, style: Theme.of(context).textTheme.headline6
                  ),
                ),
              ]),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
