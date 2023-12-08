import 'package:bmi/constants.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String resultDesc;

   ResultsPage({required this.bmiResult, required this.resultDesc, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              const Padding(
               padding: EdgeInsets.only(left: 15),
               child: Text("Your Result", style: extraLargeTextStyle,),
             ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: activeCardColor,
                onPress: (){},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText, style: extraLargeTextStyle,),
                    Text(bmiResult, style: boldTextStyle,),
                    Text(
                      resultDesc,
                      style: largeTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'RE-CALCULATE',
              onTheTapGo: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
