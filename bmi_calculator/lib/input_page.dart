import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          cardColor: selectedGender == Gender.MALE
                              ? kActiveColor
                              : kInactiveColor,
                          child: IconContent(
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                          callback: () {
                            setState(() {
                              selectedGender = Gender.MALE;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          cardColor: selectedGender == Gender.FEMALE
                              ? kActiveColor
                              : kInactiveColor,
                          child: IconContent(
                            icon: FontAwesomeIcons.venus,
                            label: 'FEMALE',
                          ),
                          callback: () {
                            setState(() {
                              selectedGender = Gender.FEMALE;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    cardColor: kActiveColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('in', style: kLabelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kAccentColor,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: kTransparentAccentColor,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kGreyColor,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kMinHeight,
                            max: kMaxHeight,
                            onChanged: (newHeight) => setState(() {
                              height = newHeight.toInt();
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableCard(cardColor: kActiveColor),
                      ),
                      Expanded(
                        child: ReusableCard(cardColor: kActiveColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kAccentColor,
            margin: EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
