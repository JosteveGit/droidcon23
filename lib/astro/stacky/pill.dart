import 'package:flutter/material.dart';

class Pill extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  const Pill({
    super.key,
    this.width = 40,
    this.height = 3,
   required this.color,
  });

  @override
  State<Pill> createState() => _PillState();
}

class _PillState extends State<Pill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
