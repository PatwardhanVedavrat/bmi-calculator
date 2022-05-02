import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed, this.onLongPress});
  final IconData icon;
  final Function onPressed;
  final Function onLongPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      onLongPress: onLongPress,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
