import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            animate = !animate;
          });
        },
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              fontSize: animate ? 50 : 30,
              color: animate ? Colors.green : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            child: const Text(
              "#DroidCon23",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
