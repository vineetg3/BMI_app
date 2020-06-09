import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 52.0,
        height: 52.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      onPressed: onPressed,
      elevation: 0.0,
      child: Icon(
        icon,
      ),
    );
  }
}