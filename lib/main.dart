import 'package:droidcon23/implicit_animations/fade_animation.dart';
import 'package:droidcon23/implicit_animations/position_animation.dart';
import 'package:droidcon23/implicit_animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'implicit_animations/text_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: [
        const FadeAnimation(),
        const PositionedAnimation(),
        const ScaleAnimation(),
        const TextAnimation()
      ][0],
    );
  }
}
