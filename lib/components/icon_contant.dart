import 'package:flutter/material.dart';
import '../constant/constants.dart';
class IconWidget extends StatelessWidget {
  const IconWidget({super.key,required this.lebal, required this.icon});
  final String lebal;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
         const SizedBox(
          height: 15.0,
        ),
        Text(lebal,style: kLebalTextStyle),
      ],
    );
  }
}