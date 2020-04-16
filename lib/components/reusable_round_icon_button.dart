import 'package:flutter/material.dart';

class ReusableRoundIconButton extends StatelessWidget {
  ReusableRoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      onPressed: onPressed,
      elevation: 0.0,
      child: Icon(icon),
    );
  }
}
