import 'package:droidcon23/astro/stacky/astronaut.dart';
import 'package:droidcon23/astro/stacky/controllers.dart';
import 'package:droidcon23/astro/stacky/header.dart';
import 'package:droidcon23/astro/stacky/pill.dart';
import 'package:droidcon23/astro/stacky/rounded_text.dart';
import 'package:droidcon23/astro/wheel.dart';
import 'package:flutter/material.dart';

class AstroStackPage extends StatefulWidget {
  const AstroStackPage({super.key});

  @override
  State<AstroStackPage> createState() => _AstroStackPageState();
}

class _AstroStackPageState extends State<AstroStackPage>
    with SingleTickerProviderStateMixin {
  late final controller = PageController();

  final planets = ["EARTH", "MARS"];
  bool insideAstronaut = false;
  bool draggedMoonDown = false;

  double get target {
    return insideAstronaut ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 100),
            Expanded(
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: RoundedText(),
                  ),
                  AnimatedScale(
                    scale: insideAstronaut ? 10 : 1,
                    duration: const Duration(milliseconds: 900),
                    child: const Center(
                      child: Astronaut(),
                    ),
                  ),
                  Positioned(
                    top: 260,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 100,
                      width: 187,
                      child: PageView(
                        controller: controller,
                        children: [
                          for (final planet in planets)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/half_${planet.toLowerCase()}.png",
                                  width: 130,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 220,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        "assets/images/grad.png",
                        width: 189,
                        height: 189,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 120,
                    left: 0,
                    right: 0,
                    child: Controllers(controller: controller),
                  ),
                  Positioned(
                    bottom: -180,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Wheel(
                        onSelected: (value) {},
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            insideAstronaut = !insideAstronaut;
                          });
                        },
                        child: const Text(
                          "EARTH",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 55,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Pill(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
