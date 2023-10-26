import 'package:flutter/material.dart';

class AnimatedScaleExample extends StatefulWidget {
  const AnimatedScaleExample({super.key});

  @override
  State<AnimatedScaleExample> createState() => _AnimatedScaleExampleState();
}

class _AnimatedScaleExampleState extends State<AnimatedScaleExample> {
  bool scaledUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            scaledUp = !scaledUp;
          });
        },
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedScale(
            scale: scaledUp ? 2 : 1,
            duration: const Duration(seconds: 1),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
