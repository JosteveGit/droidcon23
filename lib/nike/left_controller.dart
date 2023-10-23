import 'package:droidcon23/nike/right_controller.dart';
import 'package:flutter/material.dart';

class LeftController extends StatelessWidget {
  const LeftController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const RotatedBox(
      quarterTurns: 2,
      child: RightController(),
    );
  }
}
