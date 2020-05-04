import 'package:flutter/material.dart';
import 'constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({this.label, this.route});

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        width: double.infinity,
        color: kAccentColor,
        padding: (Theme.of(context).platform == TargetPlatform.iOS)
            ? EdgeInsets.only(bottom: 20.0)
            : null,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            label,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
