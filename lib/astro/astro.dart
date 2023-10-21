import 'dart:math';

import 'package:droidcon23/astro/wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AstroPage extends StatefulWidget {
  const AstroPage({super.key});

  @override
  State<AstroPage> createState() => _AstroPageState();
}

class _AstroPageState extends State<AstroPage>
    with SingleTickerProviderStateMixin {
  late final controller = PageController();

  final planets = ["EARTH", "MARS"];
  bool insideAstronaut = false;

  double get target {
    return insideAstronaut ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Row(
                    children: [
                      Icon(Icons.search),
                      Spacer(),
                      Text(
                        "ASTRONOMY",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.menu),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 40),
                        child: const SizedBox(
                          height: 350,
                          child: Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "MARS",
                                style: TextStyle(
                                  fontSize: 100,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, 220),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/astronaut1.png',
                                width: 300,
                              ).animate(target: target).scaleXY(
                                    begin: 1,
                                    end: 10,
                                    duration: 900.ms,
                                    curve: Curves.easeInCubic,
                                  ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -40),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 100,
                                      width: 187,
                                      child: PageView(
                                        controller: controller,
                                        children: [
                                          for (final planet in planets)
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/images/half_${planet.toLowerCase()}.png",
                                                  width: 130,
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    )
                                        .animate(target: target)
                                        .scaleXY(
                                          begin: 1,
                                          end: 3.5,
                                          duration: 1500.ms,
                                        )
                                        .moveY(
                                          begin: 1,
                                          end: 300,
                                          duration: 1500.ms,
                                        ),
                                  ),
                                  Center(
                                    child: Image.asset(
                                      "assets/images/grad.png",
                                      width: 189,
                                      height: 189,
                                    )
                                        .animate(target: target)
                                        .scaleXY(
                                          begin: 1,
                                          end: 3.5,
                                          duration: 1500.ms,
                                        )
                                        .moveY(
                                          begin: 1,
                                          end: 300,
                                          duration: 1500.ms,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                Transform.translate(
                                  offset: const Offset(0, -50),
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "MOON",
                                            style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[100]!
                                                  .withOpacity(0.4),
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 1,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[100]!
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/half_mars.png",
                                        width: 130,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/images/grad.png",
                                    width: 189,
                                    height: 189,
                                  ),
                                )
                              ],
                            )
                                .animate(target: target)
                                .fadeIn(duration: 1000.ms, delay: 1000.ms)
                                .scaleXY(begin: 1, end: 1.8)
                                .moveY(end: -20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, 220),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInCubic,
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("You are pressing me");
                            controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInCubic,
                            );
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate(target: target)
                      .fade(end: 0, duration: 300.ms)
                      .then(delay: 300.ms)
                      .moveX(end: -40),
                ),
                Transform.translate(
                  offset: const Offset(0, 220),
                  child: Wheel(
                    onSelected: (index) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInCubic,
                      );
                    },
                  )
                      .animate(target: target)
                      .fade(end: 0, duration: 300.ms)
                      .then(delay: 300.ms)
                      .moveY(end: -350),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, 35),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
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
                    ).animate(target: target).tint(color: Colors.white).moveY(
                          begin: 1,
                          end: -45,
                          duration: 1500.ms,
                        ),
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ).animate(target: target).fadeOut(),
                    Column(
                      children: [
                        const Text(
                          "Is the third planet from the Sun and the only object in \n the Universe known to harbor life.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Read more",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    )
                        .animate(target: target)
                        .tint(color: Colors.white)
                        .fade(
                          begin: 0,
                          end: 1,
                          duration: 500.ms,
                          delay: 1000.ms,
                        )
                        .moveY(
                          begin: 1,
                          end: -45,
                          duration: 500.ms,
                          delay: 1000.ms,
                        ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
