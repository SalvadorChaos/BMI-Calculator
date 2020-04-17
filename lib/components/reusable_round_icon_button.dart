import 'package:flutter/material.dart';

class ReusableRoundIconButton extends StatelessWidget {
  ReusableRoundIconButton({
    @required this.icon,
    @required this.onPressed,
    this.onLongPress,
    this.onLongPressUp,
  });

  final IconData icon;
  final Function onPressed;
  final Function onLongPress;
  final Function onLongPressUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: RawMaterialButton(
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),
        onPressed: onPressed,
        elevation: 0.0,
        child: Icon(icon),
      ),
    );
  }
}
