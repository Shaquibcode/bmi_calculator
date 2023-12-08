import 'package:bmi/calculator_brain.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;

  Gender? selectGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  // void update(Gender selectGender){
  //   if(selectGender == Gender.male){
  //     if(maleCardColor == inActiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inActiveCardColor;
  //     }else{
  //       maleCardColor = inActiveCardColor;
  //     }
  //   }
  //
  //   if(selectGender == Gender.female){
  //     if(femaleCardColor == inActiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inActiveCardColor;
  //     }else{
  //       femaleCardColor = inActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    cardChild:
                        const IconContent(icon: Icons.male, text: "Male"),
                    colour: selectGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    cardChild: const IconContent(
                      icon: Icons.female,
                      text: "Female",
                    ),
                    colour: selectGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: activeCardColor,
            onPress: () {},
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HEIGHT",
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: numberTextStyle,
                    ),
                    const Text(
                      "Cm",
                      style: labelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  activeColor: Colors.pink,
                  inactiveColor: Colors.grey,
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.horizontal_rule,
                              onTheTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onTheTap: () {
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
                    colour: activeCardColor,
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.horizontal_rule,
                              onTheTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onTheTap: () {
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
            text: 'CALCULATE',
            onTheTapGo: () {
              CalculatorBrain calcBrain =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calcBrain.calculateBmi(),
                    resultDesc: calcBrain.getDesc(),
                    resultText: calcBrain.getResult(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTheTap;
  const RoundIconButton(
      {super.key, required this.icon, required this.onTheTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTheTap,
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4C4F5E),
      child: Icon(icon),
    );
  }
}
