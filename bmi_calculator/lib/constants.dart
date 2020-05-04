import 'package:flutter/material.dart';

enum Unit { IMPERICAL, IMPERICAL_INCHES, METRIC }

enum BMIStatus { UNDERWEIGHT, NORMAL, OVERWEIGHT }

const Unit kUnitOfMeasurement = Unit.IMPERICAL;

final kMinHeight = kUnitOfMeasurement == Unit.METRIC ? 60.0 : 25.0;
final kMaxHeight = kUnitOfMeasurement == Unit.METRIC ? 230.0 : 90.0;
final kMinWeight = kUnitOfMeasurement == Unit.METRIC ? 20.0 : 40.0;
final kMaxWeight = kUnitOfMeasurement == Unit.METRIC ? 180.0 : 400.0;
int kWeightIncrement = kUnitOfMeasurement == Unit.METRIC ? 1 : 5;

const kActiveColor = Color(0xFF1D1E33);
const kInactiveColor = Color(0xFF111328);
const kTransparentAccentColor = Color(0x29EB1555);
const kAccentColor = Color(0xFFEB1555);
const kActiveButtonColor = Color(0xFF4C4F5E);
const kGreyColor = Color(0xFF8D8E98);
const kBottomContainerHeight = 80.0;

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: kGreyColor,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

final kResultNumRatingTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF61DC85),
);

const kResultNumberTextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.w900,
);

const kResultCommentTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w300,
);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kHeaderTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
