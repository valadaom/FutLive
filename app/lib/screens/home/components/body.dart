import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/all_next_games.dart';
import 'package:plant_app/screens/home/components/all_recent_games.dart';
import 'package:plant_app/screens/home/components/all_stats.dart';

import 'stats_main.dart';
import 'header_with_seachbox.dart';
import 'recent_games.dart';
import 'next_games.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.username
  }) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size, username: username),
          TitleWithMoreBtn(title: "Rodada anterior", press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllRecentGames(),
              ),
            );
          }),
          RecentGames(),
          TitleWithMoreBtn(title: "Rodada atual", press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllNextGames(),
              ),
            );
          }),
          NextGames(),
          TitleWithMoreBtn(title: "Estatísticas", press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllStats(),
              ),
            );
          }),
          StatsMain(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
