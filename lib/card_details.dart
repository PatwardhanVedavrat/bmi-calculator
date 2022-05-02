import 'package:flutter/material.dart';
import 'constants.dart';

class CardDetails extends StatelessWidget {
  CardDetails({@required this.cardIcon, @required this.cardText});
  final IconData cardIcon;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kTextStyleThin,
        ),
      ],
    );
  }
}
