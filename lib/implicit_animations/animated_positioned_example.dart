import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool move = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            move = !move;
          });
        },
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              top: move ? 60 : 0,
              right: 0,
              left: 0,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
