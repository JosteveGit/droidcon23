import 'package:droidcon23/astro/astro.stack.dart';
import 'package:droidcon23/implicit_animations/animated_opacity_example.dart';
import 'package:droidcon23/implicit_animations/animated_positioned_example.dart';
import 'package:droidcon23/implicit_animations/animated_scale_example.dart';
import 'package:droidcon23/nike/nike_page.dart';
import 'package:droidcon23/power/power_page.dart';
import 'package:droidcon23/rockets/rockets_page.dart';
import 'package:flutter/material.dart';
import 'implicit_animations/animated_text_example.dart';

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
        const AnimatedOpacityExample(),
        const AnimatedPositionedExample(),
        const AnimatedScaleExample(),
        const AnimatedTextExample(),
        const PowerPage(),
        const AstroStackPage(),
        const RocketsPage(),
        const NikePage()
      ][0],
    );
  }
}
