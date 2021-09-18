import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/models/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_container_button.dart';
import '../components/icon_content.dart';
import '../util/constants.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 175;
  double weight = 60;
  int age = 20;
  Gender selectedGender;

  void updateWeight(int value) {
    if (weight > 0 || value > 0) {
      setState(() {
        weight += value;
      });
    }
  }

  void updateAge(int value) {
    if (age > 0 || value > 0) {
      setState(() {
        age += value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: kBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ReusableCard(
                          onTap: () => setState(() {
                                selectedGender = Gender.male;
                              }),
                          color: selectedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          child: IconContent(
                              icon: FontAwesomeIcons.mars, label: 'MALE')),
                    ),
                    Expanded(
                      child: ReusableCard(
                          onTap: () => setState(() {
                                selectedGender = Gender.female;
                              }),
                          color: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          child: IconContent(
                              icon: FontAwesomeIcons.venus, label: 'FEMALE')),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: ReusableCard(
                  color: kInactiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kCardLabelStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toStringAsFixed(0),
                            style: kCardNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kCardLabelStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: kProjectAccentColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16.0),
                            activeTrackColor: Colors.white,
                            overlayColor: kProjectAccentColor.withAlpha(0x29),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 32.0)),
                        child: Slider(
                            value: height,
                            min: 130,
                            max: 230,
                            divisions: 100,
                            inactiveColor: kProjectGreyColor,
                            onChanged: (double newHeight) {
                              setState(() {
                                height = newHeight;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kCardLabelStyle,
                            ),
                            Text(
                              weight.toStringAsFixed(0),
                              style: kCardNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () => updateWeight(-1)),
                                RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () => updateWeight(1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kInactiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kCardLabelStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kCardNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () => updateAge(-1)),
                                RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () => updateAge(1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomContainerButton(
                title: 'CALCULATE YOUR BMI',
                onTap: () {
                  BmiCalculator bmiCalculator =
                      BmiCalculator(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiNumberResult: bmiCalculator.getBmiResult(),
                        bmiText: bmiCalculator.getTextResult(),
                        bmiInterpretation:
                            bmiCalculator.getResultInterpretation(),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
