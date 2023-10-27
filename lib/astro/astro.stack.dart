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
  bool onReadMore = false;

  late final TabController tabController =
      TabController(length: 3, vsync: this);

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
    if (!draggedMoonDown && !onReadMore) {
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
    if (draggedMoonDown && !onReadMore) {
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
              const SizedBox(height: double.maxFinite),
              const Header(),
              const Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: RoundedText(),
                ),
              ),

              // ASTRONAUT.
              // The astronaut scales in.
              Positioned(
                top: 290,
                left: 0,
                right: 0,
                child: Center(
                  child: AnimatedScale(
                    scale: insideAstronaut ? 10 : 1,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                    child: const Astronaut(),
                  ),
                ),
              ),

              //EARTH.
              // The earth moves down.
              AnimatedPositioned(
                top: draggedMoonDown
                    ? 820
                    : insideAstronaut
                        ? 720
                        : 360,
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
                top: insideAstronaut ? 640 : 320,
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

              //ARROWS.
              //The arrows fades out.
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
              //The wheel fades out.
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

              // The “EARTH” text fades out as it moves down
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
                          color: insideAstronaut ? Colors.white : Colors.black,
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

              // The pill under the “Earth” text fades out.
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

              // The other information and read more fade out as they move down
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
              // The moon scales out as it moves up.
              AnimatedPositioned(
                top: onReadMore
                    ? 30
                    : delayedDagMoonDown
                        ? 750
                        : insideAstronaut
                            ? 400
                            : 200,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                child: AnimatedScale(
                  scale: onReadMore ? 0.5 : 1,
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
              ),
              AnimatedPositioned(
                top: onReadMore
                    ? -70
                    : delayedDagMoonDown
                        ? 650
                        : insideAstronaut
                            ? 330
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
              // The “MOON” text becomes bigger as it moves up.
              AnimatedPositioned(
                top: onReadMore
                    ? 20
                    : delayedDagMoonDown
                        ? 690
                        : insideAstronaut
                            ? 350
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
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedDefaultTextStyle(
                          style: TextStyle(
                            fontSize: onReadMore ? 16 : 12,
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
              ),
              // The pill under the moon fades out.
              AnimatedPositioned(
                top: insideAstronaut ? 367 : 257,
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
              // Other information, read more and the indicators fade out.
              AnimatedPositioned(
                bottom: delayedDagMoonDown ? 40 : -100,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: onReadMore ? 0 : 1,
                  duration: const Duration(milliseconds: 1000),
                  child: AnimatedOpacity(
                    opacity: delayedDagMoonDown ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            "Is an astronomical body that orbits planet Earth, being\nEarth's only permanent natural satellite...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                onReadMore = true;
                              });
                            },
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
              ),

              // INDICATOR.
              // The indicator switches
              Positioned(
                left: 0,
                right: 0,
                bottom: 200,
                child: AnimatedOpacity(
                  opacity: onReadMore ? 0 : 1,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeInOut,
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
              ),

              // A white container moves up.
              AnimatedPositioned(
                top: onReadMore ? 70 : 1000,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        tabs: const [
                          Tab(text: "DISCOVER"),
                          Tab(text: "HISTORY"),
                          Tab(text: "DIAGRAMS"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: ListView(
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    "The Moon",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    "Is an astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). Following Jupiter's satellite Io, the Moon is second-densest satellite among those whose densities are known.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 150,
                                    width: double.maxFinite,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                          color: Colors.black,
                                          width: 300,
                                        ),
                                        const SizedBox(width: 20),
                                        Container(
                                          color: Colors.grey,
                                          width: 300,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Formation",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    "The prevailing hypothesis is that the Earth–Moon system formed after an impact of a Mars-sized body (named Theia) with the proto-Earth more than 4.5 billion years ago (Ga). The impact blasted material into Earth's orbit and the material accreted and formed the Moon. The Moon's far side has a crust that is 30 mi (48 km) thicker than that of the near side. This is thought to be due to the Moon having been amalgamated from two different bodies. Some astronomers think that about 4.5 Ga, an object the size of Mars, sometimes called Theia, collided with the ancient Earth (called Gaia) and splashed billions of tons of debris into orbit around it. This debris settled around Gaia in an orbiting mass, creating a proto-lunar disk. Eventually, material in this disk began to coalesce, forming the Moon.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 200),
                                ],
                              ),
                            ),
                            Container(),
                            Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //A back button moves from left to right.
              AnimatedPositioned(
                top: 20,
                left: onReadMore ? 20 : -50,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onReadMore = false;
                    });
                  },
                  child: const Text(
                    "< Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
