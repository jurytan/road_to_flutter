import 'package:flutter/material.dart';

const kRoundedTopDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

const kBottomSheetBackgroundContainerDecoration = BoxDecoration(
  color: Color(0xff757575),
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
);

const kSubtitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
);

const kBottomSheetTitleTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontSize: 30.0,
);

const kBottomSheetTextFieldDecoration = InputDecoration(
  border: UnderlineInputBorder(
      borderSide: BorderSide(
    color: Colors.lightBlueAccent,
  )),
  hintText: 'Enter a task',
  focusColor: Colors.lightBlueAccent,
);

const kBottomSheetFlatButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);
