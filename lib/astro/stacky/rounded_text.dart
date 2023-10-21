import 'package:flutter/material.dart';

class RoundedText extends StatelessWidget {
  const RoundedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 350,
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          "EARTH",
          maxLines: 1,
          style: TextStyle(
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
