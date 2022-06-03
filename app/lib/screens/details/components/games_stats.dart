import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$text\n",
                  style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
