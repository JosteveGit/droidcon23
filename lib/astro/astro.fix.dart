import 'package:droidcon23/astro/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AstroFixPage extends StatefulWidget {
  const AstroFixPage({super.key});

  @override
  State<AstroFixPage> createState() => _AstroFixPageState();
}

class _AstroFixPageState extends State<AstroFixPage>
    with SingleTickerProviderStateMixin {
  late final controller = PageController();

  final planets = ["EARTH", "MARS"];
  bool insideAstronaut = false;
  bool draggedMoonDown = false;

  double get target {
    return insideAstronaut ? 1 : 0;
  }

  double get dragDownTarget {
    return draggedMoonDown ? 1 : 0;
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
                const Header(),
                const SizedBox(height: 60),
                Expanded(
                  child: Stack(
                    children: [
                      const RoundedText(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 300,
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
                              )
                                  .animate(target: dragDownTarget)
                                  .moveY(end: 100)
                                  .fadeOut(),
                              Container(
                                color: Colors.transparent,
                                child: Moon(
                                  target: target,
                                  dragDownTarget: dragDownTarget,
                                  onDragDown: () {
                                    setState(() {
                                      draggedMoonDown = true;
                                    });
                                  },
                                  onDragUp: () {
                                    setState(() {
                                      draggedMoonDown = false;
                                    });
                                  },
                                ),
                              ).animate(target: dragDownTarget).moveY(
                                    end: 170,
                                    duration: 1000.ms,
                                    curve: Curves.easeOut,
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Controllers(controller: controller)
                    .animate(target: target)
                    .fade(end: 0, duration: 300.ms)
                    .then(delay: 300.ms)
                    .moveX(end: -40),
                Container(
                  height: 100,
                )
                    .animate(target: target)
                    .fade(end: 0, duration: 300.ms)
                    .then(delay: 300.ms)
                    .moveY(end: -350),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.maxFinite,
                height: 100,
                child: Container(
                  color: Colors.transparent,
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
                      )
                          .animate(target: target)
                          .tint(
                            color: Colors.white,
                          )
                          .moveY(
                            begin: 1,
                            end: -15,
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
                            end: -15,
                            duration: 500.ms,
                            delay: 1000.ms,
                          ),
                      // ],
                    ],
                  ),
                ),
              ),
            )
                .animate(target: dragDownTarget)
                .fade(end: 0.1)
                .moveY(end: 180, duration: 1500.ms)
          ],
        ),
      ),
    );
  }
}

class Moon extends StatefulWidget {
  final VoidCallback onDragDown;
  final VoidCallback onDragUp;
  const Moon({
    super.key,
    required this.target,
    required this.onDragDown,
    required this.dragDownTarget,
    required this.onDragUp,
  });

  final double target;
  final double dragDownTarget;

  @override
  State<Moon> createState() => _MoonState();
}

class _MoonState extends State<Moon> {
  double initialY = 0.0;
  double currentY = 0.0;
  double dragDistanceThreshold = 50.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (details) {
        initialY = details.globalPosition.dy;
      },
      onVerticalDragUpdate: (details) {
        currentY = details.globalPosition.dy;
        double distance = currentY - initialY;
        if (distance.abs() > dragDistanceThreshold) {
          if (distance > 0) {
            // Dragged down
            widget.onDragDown();
            // _performAction("Dragged Down");
          } else {
            // Dragged up
            widget.onDragUp();
            // _performAction("Dragged Up");
          }
          initialY = currentY;
        }
      },
      onTap: () {
        print("hi");
      },
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/half_mars.png",
                  width: 130,
                )
                    .animate(target: widget.dragDownTarget)
                    .scaleXY(
                      begin: 1,
                      end: 2,
                      duration: 900.ms,
                      curve: Curves.easeOut,
                    )
                    .moveY(
                      begin: 1,
                      end: 80,
                      duration: 900.ms,
                      curve: Curves.easeOut,
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
              .animate(target: widget.dragDownTarget)
              .scaleXY(
                begin: 1,
                end: 2,
                duration: 900.ms,
                curve: Curves.easeOut,
              )
              .moveY(
                begin: 1,
                end: 80,
                duration: 900.ms,
                curve: Curves.easeOut,
              ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("hello");
                    },
                    child: const Text(
                      "MOON",
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 83, 82, 82),
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 83, 82, 82),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).animate(target: widget.dragDownTarget).fadeOut(),
                ],
              ),
            ),
          )
              .animate(target: widget.dragDownTarget)
              .tint(color: Colors.white)
              .moveY(
                end: 90,
                duration: 900.ms,
                curve: Curves.easeOut,
              ),
        ],
      )
          .animate(target: widget.target)
          .fadeIn(duration: 1000.ms, delay: 1000.ms)
          .scaleXY(begin: 1, end: 1.8)
          .moveY(end: -20),
    );
  }
}
