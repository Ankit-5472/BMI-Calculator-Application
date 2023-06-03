import 'package:flutter/material.dart';

class reuseCard extends StatelessWidget {
  const reuseCard({super.key, required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      margin: const EdgeInsets.all(15.0),
      child: cardChild,
    );
  }
}
