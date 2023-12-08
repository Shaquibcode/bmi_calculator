import 'package:bmi/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {

  final String text;
  final VoidCallback onTheTapGo;
  const BottomButton({super.key, required this.text, required this.onTheTapGo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTheTapGo,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
        decoration: BoxDecoration(
          color: bottomContainerColor,
        ),
        child: Center(
          child: Text(
            text,
            style: largeTextStyle,
          ),
        ),
      ),
    );
  }
}