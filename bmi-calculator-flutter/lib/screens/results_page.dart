import 'package:bmi_calculator/components/bottom_container_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/util/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiInterpretation,
      @required this.bmiNumberResult,
      @required this.bmiText});

  final String bmiNumberResult;
  final String bmiText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: Text(
              'Your Result',
              style: kResultTitleStyle,
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ReusableCard(
                color: kActiveCardColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiText.toUpperCase(),
                        style: kNormalResult,
                      ),
                      Text(
                        bmiNumberResult,
                        style: kResultNumber,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Normal BMI range:',
                              style: kCardLabelStyle,
                            ),
                            Text(
                              '18,5 - 25 kg/m2',
                              style: kResultText,
                            ),
                          ]),
                      Center(
                        child: Text(
                          bmiInterpretation,
                          style: kResultText,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: BottomContainerButton(
            title: 'RE-CALCULATE YOUR BMI',
            onTap: () => Navigator.pop(context),
          ))
        ],
      ),
    );
  }
}
