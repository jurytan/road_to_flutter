import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'calculate_button.dart';
import 'constants.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 60;
  int weight = 100;
  int age = 20;

  List<Text> _renderHeight(int height) {
    switch (kUnitOfMeasurement) {
      case Unit.IMPERICAL_INCHES:
        return [
          Text(
            (height).toString(),
            style: kNumberTextStyle,
          ),
          Text('in', style: kLabelTextStyle),
        ];
      case Unit.IMPERICAL:
        return [
          Text(
            (height ~/ 12).toString(),
            style: kNumberTextStyle,
          ),
          Text('ft', style: kLabelTextStyle),
          Text(
            (height % 12).toString(),
            style: kNumberTextStyle,
          ),
          Text('in', style: kLabelTextStyle),
        ];
      case Unit.METRIC:
        return [
          Text(
            (height).toString(),
            style: kNumberTextStyle,
          ),
          Text('cm', style: kLabelTextStyle),
        ];
      default:
        return new List<Text>();
    }
  }

  List<Text> _renderWeight(int weight) {
    List<Text> results = [
      Text(
        weight.toString(),
        style: kNumberTextStyle,
      ),
    ];
    switch (kUnitOfMeasurement) {
      case Unit.IMPERICAL_INCHES:
      case Unit.IMPERICAL:
        results.add(Text('lb', style: kLabelTextStyle));
        break;
      case Unit.METRIC:
        results.add(Text('kg', style: kLabelTextStyle));
        break;
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.sort),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [],
        ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          children: _renderHeight(height),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kAccentColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ReusableCard(
                          cardColor: kInactiveColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: _renderWeight(weight),
                              ),
                              // add two buttons here
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    callback: () {
                                      setState(() {
                                        if (weight - kWeightIncrement >=
                                            kMinWeight) {
                                          weight -= kWeightIncrement;
                                        }
                                        print('Weight --');
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    callback: () {
                                      setState(() {
                                        if (weight + kWeightIncrement <=
                                            kMaxWeight) {
                                          weight += kWeightIncrement;
                                        }
                                        print('Weight ++');
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
                          cardColor: kInactiveColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              // add two buttons here
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    callback: () {
                                      setState(() {
                                        if (age - 1 >= 5) {
                                          age--;
                                        }
                                        print('Age --');
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    callback: () {
                                      setState(() {
                                        if (age + 1 <= 120) {
                                          age++;
                                        }
                                        print('Age ++');
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
              ],
            ),
          ),
          CalculateButton(
            label: 'CALCULATE',
            route: '/results',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.callback});

  final IconData icon;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.callback,
      child: Icon(
        icon,
        color: Colors.white,
        size: 25.0,
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kActiveButtonColor,
    );
  }
}
