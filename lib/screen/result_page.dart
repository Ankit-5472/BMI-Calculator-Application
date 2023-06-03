import 'package:bmi_calculator/constant/constants.dart';
import 'package:bmi_calculator/components/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: kResulttextStyle,),),),
          Expanded(
            flex: 5,
            child: reuseCard(colour: kActiveCardColor, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(),style: kResultContainertextStyle,),
                Text(bmiResult, style: kBMItextStyle,),
                Text(interpretation, style: kBMIBodytextStyle,textAlign: TextAlign.center,),
              ],
            ),),),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: "RE-CALCULATE")
        ],
      ),
    );
  }
}
