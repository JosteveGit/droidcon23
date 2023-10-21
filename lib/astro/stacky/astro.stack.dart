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
  bool delayedInsideAstronaut = false;
  bool draggedMoonDown = false;
  bool delayedDagMoonDown = false;

  double get target {
    return insideAstronaut ? 1 : 0;
  }

  double initialY = 0.0;
  double currentY = 0.0;
  final dragDistanceThreshold = 100.0;

  int get viewingIndex {
    return delayedDagMoonDown ? 1 : 0;
  }

  void onDraggedDown() async {
    if (!draggedMoonDown) {
      setState(() {
        draggedMoonDown = true;
      });
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        delayedDagMoonDown = true;
      });
    }
  }

  void onDraggedUp() async {
    if (draggedMoonDown) {
      setState(() {
        delayedDagMoonDown = false;
      });
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        draggedMoonDown = false;
      });
    }
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
              child: GestureDetector(
                onVerticalDragDown: (details) {
                  initialY = details.globalPosition.dy;
                },
                onVerticalDragUpdate: (details) {
                  if (insideAstronaut) {
                    currentY = details.globalPosition.dy;
                    double distance = currentY - initialY;
                    if (distance.abs() > dragDistanceThreshold) {
                      if (distance > 0) {
                        onDraggedDown();
                      } else {
                        onDraggedUp();
                      }
                      initialY = currentY;
                    }
                  }
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: RoundedText(),
                    ),

                    // ASTRONAUT.
                    AnimatedScale(
                      scale: insideAstronaut ? 10 : 1,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      child: const Center(
                        child: Astronaut(),
                      ),
                    ),

                    //EARTH.
                    AnimatedPositioned(
                      top: draggedMoonDown
                          ? 700
                          : insideAstronaut
                              ? 600
                              : 260,
                      left: 0,
                      right: 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedScale(
                        scale: insideAstronaut ? 3.1 : 1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
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
                    ),
                    AnimatedPositioned(
                      top: insideAstronaut ? 520 : 220,
                      left: 0,
                      right: 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedScale(
                        scale: insideAstronaut ? 3.5 : 1,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 1000),
                        child: Center(
                          child: Image.asset(
                            "assets/images/grad.png",
                            width: 189,
                            height: 189,
                          ),
                        ),
                      ),
                    ),

                    //CONTROLLERS.
                    Positioned(
                      bottom: 120,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        opacity: insideAstronaut ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastOutSlowIn,
                        child: Controllers(controller: controller),
                      ),
                    ),

                    // WHEEL.
                    Positioned(
                      bottom: -180,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        opacity: insideAstronaut ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        child: Center(
                          child: Wheel(
                            onSelected: (value) {},
                          ),
                        ),
                      ),
                    ),

                    AnimatedPositioned(
                      bottom: draggedMoonDown
                          ? 20
                          : insideAstronaut
                              ? 80
                              : 60,
                      left: 0,
                      right: 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedOpacity(
                        opacity: draggedMoonDown ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                insideAstronaut = !insideAstronaut;
                              });
                              if (insideAstronaut) {
                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );
                              }
                              setState(() {
                                delayedInsideAstronaut = insideAstronaut;
                              });
                            },
                            child: AnimatedDefaultTextStyle(
                              style: TextStyle(
                                fontSize: 12,
                                color: insideAstronaut
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              duration: const Duration(milliseconds: 400),
                              child: const Text(
                                "EARTH",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 55,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        opacity: insideAstronaut ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        child: Center(
                          child: Pill(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: draggedMoonDown
                          ? -10
                          : insideAstronaut
                              ? 30
                              : 0,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOut,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        opacity: draggedMoonDown ? 0 : 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: AnimatedOpacity(
                          opacity: insideAstronaut ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: Column(
                            children: [
                              const Text(
                                "Is the third planet from the Sun and the only object in \n the Universe known to harbor life.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Read more",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    //MOON.
                    AnimatedPositioned(
                      top: delayedDagMoonDown
                          ? 650
                          : insideAstronaut
                              ? 320
                              : 200,
                      left: 0,
                      right: 0,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      child: AnimatedScale(
                        scale: delayedDagMoonDown ? 2.5 : 1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        child: AnimatedOpacity(
                          opacity: insideAstronaut ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: AnimatedScale(
                            scale: insideAstronaut ? 1.5 : 0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                            child: Center(
                              child: Image.asset(
                                "assets/images/moon.png",
                                width: 130,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: delayedDagMoonDown
                          ? 550
                          : insideAstronaut
                              ? 250
                              : 135,
                      left: 0,
                      right: 0,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      child: AnimatedScale(
                        scale: delayedDagMoonDown ? 2.5 : 1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        child: AnimatedScale(
                          scale: insideAstronaut ? 1.7 : 0,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          child: Center(
                            child: Image.asset(
                              "assets/images/grad.png",
                              width: 189,
                              height: 189,
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: delayedDagMoonDown
                          ? 580
                          : insideAstronaut
                              ? 270
                              : 240,
                      left: 0,
                      right: 0,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      child: AnimatedOpacity(
                        opacity: insideAstronaut ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: AnimatedScale(
                          scale: insideAstronaut ? 1 : 0,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOut,
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              style: TextStyle(
                                fontSize: 12,
                                color: delayedDagMoonDown
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.3),
                                fontWeight: FontWeight.bold,
                              ),
                              duration: const Duration(milliseconds: 400),
                              child: const Text(
                                "MOON",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: insideAstronaut ? 287 : 257,
                      left: 0,
                      right: 0,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      child: AnimatedOpacity(
                        opacity: delayedDagMoonDown ? 0 : 1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        child: AnimatedOpacity(
                          opacity: insideAstronaut ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          child: AnimatedScale(
                            scale: insideAstronaut ? 1 : 0,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                            child: Center(
                              child: Pill(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 200,
                      child: AnimatedOpacity(
                        opacity: delayedInsideAstronaut ? 1 : 0,
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeInOut,
                        child: Center(
                          child: Column(
                            children: [
                              for (int i = 0; i < 2; i++) ...[
                                AnimatedContainer(
                                  width: i != viewingIndex ? 8 : 6,
                                  height: i != viewingIndex ? 8 : 6,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: i != viewingIndex
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.3),
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
