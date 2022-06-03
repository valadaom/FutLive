import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/bet_screen.dart';

import '../../../constants.dart';

class RecomendsCamps extends StatelessWidget {
  const RecomendsCamps({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendCampsCard(
            image: "assets/images/copa.png",
            camp: "Qatar 2022",
            press: () {},
          ),
          RecomendCampsCard(
            image: "assets/images/BRA.png",
            camp: "Copa do brasil",
            press: () {},
          ),
          RecomendCampsCard(
            image: "assets/images/premier.png",
            camp: "Premier League",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendCampsCard extends StatelessWidget {
  const RecomendCampsCard({
    Key key,
    this.image,
    this.camp,
    this.press,
  }) : super(key: key);

  final String image, camp;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 3,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
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
                        TextSpan(text: "$camp\n".toUpperCase(), style: Theme.of(context).textTheme.button),
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
