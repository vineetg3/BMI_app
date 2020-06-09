import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final Function onPress;
  final String buttonTitle;

  BottomButton({@required this.onPress,@required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top:10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}