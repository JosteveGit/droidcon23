import 'package:flutter/material.dart';

class Astronaut extends StatelessWidget {
  const Astronaut({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/astronaut1.png',
      width: 300,
      height: 300,
    );
  }
}
