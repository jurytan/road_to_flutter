import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'calculate_button.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text('Your Result', style: kHeaderTextStyle),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ReusableCard(
              cardColor: kActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'OVERWEIGHT',
                    style: kResultNumRatingTextStyle,
                  ),
                  Text(
                    '26.7',
                    style: kResultNumberTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'You have a higher than normal body weight. Try to exercise more.',
                      style: kResultCommentTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            label: 'RE-CALCULATE',
            route: '/',
          ),
        ],
      ),
    );
  }
}
