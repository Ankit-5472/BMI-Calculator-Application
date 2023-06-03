import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant/constants.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: kBottomtextStyle,)),
        color: kBottomContainerColor,
        margin:  const EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.only(bottom: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}