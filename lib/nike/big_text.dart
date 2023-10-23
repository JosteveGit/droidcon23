import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final FontStyle? fontStyle;
  const BigText(this.text, {super.key, this.fontStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontStyle: fontStyle,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
