import 'package:flutter/material.dart';

class AnimatedTextExample extends StatefulWidget {
  const AnimatedTextExample({super.key});

  @override
  State<AnimatedTextExample> createState() => _AnimatedTextExampleState();
}

class _AnimatedTextExampleState extends State<AnimatedTextExample> {
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
