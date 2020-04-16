import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableBottomButton extends StatelessWidget {
  ReusableBottomButton({@required this.onTap, @required this.buttonText});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kCalculateTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 22.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
