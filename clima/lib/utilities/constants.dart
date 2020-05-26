import 'package:flutter/material.dart';

enum Unit { IMPERIAL, METRIC }

Unit kUnitSystem = Unit.IMPERIAL;

// 25°C == 77°F
int kHiTemp = kUnitSystem == Unit.IMPERIAL ? 77 : 25;

// 20°C == 68°F
int kMidTemp = kUnitSystem == Unit.IMPERIAL ? 68 : 20;

// 10°C == 50°F
int kLowTemp = kUnitSystem == Unit.IMPERIAL ? 50 : 10;

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
