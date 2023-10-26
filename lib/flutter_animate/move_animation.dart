import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MoveAnimation extends StatelessWidget {
  const MoveAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Scaffold(
      body: SafeArea(
        child: const Center(
          child: Icon(
            Icons.notifications_rounded,
            size: 100,
          ),
        )
            .animate()
            .shimmer(
              duration: 2000.ms,
              curve: Curves.easeInOut,
            )
            .then()
            .scaleXY(end: 2)
            .shake(
              hz: 8,
              curve: Curves.easeInOut,
            )
            .then()
            .moveY(end: 100),
      ),
    );
  }
}
