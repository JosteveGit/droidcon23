import 'package:flutter/material.dart';

class PositionedAnimation extends StatefulWidget {
  const PositionedAnimation({super.key});

  @override
  State<PositionedAnimation> createState() => _PositionedAnimationState();
}

class _PositionedAnimationState extends State<PositionedAnimation> {
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
