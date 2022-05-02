import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, @required this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kCalculateButton,
          ),
        ),
        color: kBottomContainerColor,
        height: 80.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        //TODO: padding: EdgeInsets.only(bottom: 15.0),  Add if needed after testing
      ),
    );
  }
}
