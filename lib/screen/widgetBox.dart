// ignore: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_contant.dart';
import '../components/reuse_card.dart';
import '../constant/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender{
  male,
  female
}

// ignore: camel_case_types
class widgetBox extends StatefulWidget {
  const widgetBox({super.key});

  @override
  State<widgetBox> createState() => _widgetBoxState();
}
// ignore: camel_case_types
class _widgetBoxState extends State<widgetBox> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColour = kInactiveCardColor;
  void updateColour (Gender selectGender){
    if(selectGender==Gender.male){
      if(maleCardColor == kInactiveCardColor){
        maleCardColor == kActiveCardColor;
        femaleCardColour == kInactiveCardColor;
      }
      else{
        maleCardColor == kInactiveCardColor;
      }
    }
    if(selectGender==Gender.female){
      if(femaleCardColour == kInactiveCardColor){
        femaleCardColour == kActiveCardColor;
        maleCardColor == kInactiveCardColor;
      }
      else{
        femaleCardColour == kInactiveCardColor;
      }
    }
  }
  int Height = 180;
  int Weight = 50;
  int Age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                        child: GestureDetector(onTap: (){
                          setState(() {
                            updateColour(Gender.male);
                          });
                        },
                          child: reuseCard(
                            colour: maleCardColor,
                            cardChild: const IconWidget(icon: FontAwesomeIcons.mars, lebal: "MALE",),
                          ),
                        ),
                ),
                Expanded(
                  child: GestureDetector(onTap: (){
                    setState(() {
                      updateColour(Gender.female);
                    });
                  },
                    child: reuseCard(
                      colour: femaleCardColour,
                      cardChild: const IconWidget(lebal: "FEMALE", icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reuseCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("HEIGHT", style: kLebalTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(Height.toString(), style: kIntegerTextStyle,),
                    Text("cm", style: kLebalTextStyle,)
                  ],
                ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(value: Height.toDouble(),
                      min: 120.0,
                      max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          Height = newValue.round();
                        });;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
            Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reuseCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: kLebalTextStyle,),
                        Text(Weight.toString(), style: kIntegerTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                Weight--;
                              });
                            },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              backgroundColor: kInactiveCardColor,
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                Weight++;
                              });
                            },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              backgroundColor: kInactiveCardColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reuseCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE", style: kLebalTextStyle,),
                        Text(Age.toString(), style: kIntegerTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                Age--;
                              });
                            },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              backgroundColor: kInactiveCardColor,
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(onPressed: (){
                              setState(() {
                                Age++;
                              });
                            },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              backgroundColor: kInactiveCardColor,
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
          BottomButton(onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: Height, weight: Weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
              resultText: calc.getResult(),
              bmiResult: calc.calculateBMI(),
              interpretation: calc.getInterpetation(),
            )),);
          }, buttonTitle: ("CALCULATE"),)
        ],
      ),
    );
  }
}





// ignore: camel_case_types
