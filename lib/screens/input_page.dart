import 'file:///F:/AndroidStudioProjects/bmi-calculator-flutter/lib/screens/results_page.dart';
import 'package:YourBMI/BMI_Brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import 'file:///F:/AndroidStudioProjects/bmi-calculator-flutter/lib/components/Bottom_button.dart';
import '../components/icon_content.dart';
import '../constants.dart';



enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender;
   int height=180;
   int weight=60;
   int age=16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress:(){
                      setState(() {
                      selectedGender=Gender.male;
                      });

                    },
                    color:selectedGender==Gender.male ?
                    kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress:(){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    color:selectedGender==Gender.female ?
                    kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                color:kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                   Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min:120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          }
                      ),
                    ),
                  ],

                ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color:kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),

                          ],
                        ),
                      ],
                    ),

                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      color:kActiveCardColour,
                      cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onPress: (){
              CalculatorBrain cb=CalculatorBrain(height: height,weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return ResultsPage(
                      bmiResult: cb.calculateBMI(),
                      interpretation: cb.getInterpretation(),
                      resultText: cb.getResult(),
                    );
                  },
              ),
              );
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








