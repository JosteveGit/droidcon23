import 'package:flutter/material.dart';

class Pill extends StatefulWidget {
  final double width;
  final double height;
  const Pill({
    super.key,
    this.width = 50,
    this.height = 5,
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
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
