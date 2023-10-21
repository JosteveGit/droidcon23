import 'package:flutter/material.dart';
import 'dart:math' as math;

class Wheel extends StatefulWidget {
  final ValueChanged<int> onSelected;
  const Wheel({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> with SingleTickerProviderStateMixin {
  double rotationAngle = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int identifyClosestIndex() {
    const numberOfCircles = 8;
    double minAngle = double.maxFinite;
    int closestIndex = -1;

    for (int i = 0; i < numberOfCircles; i++) {
      // Calculate the current angle of each circle, adjusted for the current rotation
      double currentAngle = (2 * math.pi / numberOfCircles) * i + rotationAngle;

      // Normalize the angle to a value between 0 and 2 * math.pi
      currentAngle = currentAngle % (2 * math.pi);

      // The top of the circle is at -math.pi/2 (or 3 * math.pi/2 in a positive sense)
      // Calculate the absolute difference from the top
      double difference = (3 * math.pi / 2 - currentAngle).abs();

      // The difference should be in the range [0, math.pi]
      if (difference > math.pi) {
        difference = 2 * math.pi - difference;
      }

      // If this is the smallest difference so far, save it
      if (difference < minAngle) {
        minAngle = difference;
        closestIndex = i;
      }
    }

    return closestIndex;
  }

  void onPanUpdate(DragUpdateDetails details) {
    double speed = 0.007;
    setState(() {
      rotationAngle += details.delta.dx * speed;
    });
  }

  void onPanEnd(DragEndDetails details) {
    widget.onSelected(identifyClosestIndex());
  }

  @override
  Widget build(BuildContext context) {
    const circleRadius = 300.0;
    const smallCircleRadius = 30.0;
    const numberOfCircles = 8;
    const double centerOfBigCircle = circleRadius / 2;

    List<Widget> smallCircles = [];

    for (int i = 0; i < numberOfCircles; i++) {
      final angle = (math.pi * 2 / numberOfCircles) * i;

      final x = math.cos(angle) * centerOfBigCircle +
          centerOfBigCircle -
          smallCircleRadius / 2;
      final y = math.sin(angle) * centerOfBigCircle +
          centerOfBigCircle -
          smallCircleRadius / 2;

      final circle = Transform.translate(
        offset: Offset(x, y),
        child: Container(
          width: smallCircleRadius,
          height: smallCircleRadius,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Center(
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      smallCircles.add(circle);
    }

    return GestureDetector(
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Transform.rotate(
        angle: rotationAngle,
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                width: circleRadius,
                height: circleRadius,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2,
                  ),
                ),
              ),
              ...smallCircles,
            ],
          ),
        ),
      ),
    );
  }
}
