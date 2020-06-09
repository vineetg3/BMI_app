import 'package:YourBMI/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:YourBMI/components/reusable_card.dart';
import 'package:YourBMI/components/Bottom_button.dart';

class ResultsPage extends StatefulWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({@required this.bmiResult,@required this.resultText,
    @required this.interpretation});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculated',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    widget.interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Re-Calculate',
            onPress: (){
              Navigator.pop(context);
            },
          ),
          Center(
            child: Text(
              'vineet.gandham@gmail.com',
            ),
          )
        ],
      ),

    );
  }
}
