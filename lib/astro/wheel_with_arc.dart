import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Arc with Circles'),
        ),
        body: const Center(
          child: ArcWithCircles(
              numCircles: 5), // Change the number of circles here
        ),
      ),
    );
  }
}

class ArcWithCircles extends StatelessWidget {
  final int numCircles;

  const ArcWithCircles({super.key, required this.numCircles});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: ArcPainter(numCircles: numCircles),
    );
  }
}

class ArcPainter extends CustomPainter {
  final int numCircles;

  ArcPainter({required this.numCircles});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint arcPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    const double startAngle = -pi / 2;
    const double endAngle = pi / 2;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        endAngle, false, arcPaint);

    final double interval = (endAngle - startAngle) / (numCircles - 1);

    for (int i = 0; i < numCircles; i++) {
      final double angle = startAngle + (i * interval);
      final double x = center.dx + radius * cos(angle);
      final double y = center.dy + radius * sin(angle);
      canvas.drawCircle(Offset(x, y), 5.0, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
