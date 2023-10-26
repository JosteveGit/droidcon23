import 'package:droidcon23/astro/stacky/astronaut.dart';
import 'package:droidcon23/astro/stacky/controllers.dart';
import 'package:droidcon23/astro/stacky/header.dart';
import 'package:droidcon23/astro/stacky/pill.dart';
import 'package:droidcon23/astro/stacky/rounded_text.dart';
import 'package:droidcon23/astro/wheel.dart';
import 'package:flutter/material.dart';

class AstroStackInitialPage extends StatefulWidget {
  const AstroStackInitialPage({super.key});

  @override
  State<AstroStackInitialPage> createState() => _AstroStackInitialPageState();
}

class _AstroStackInitialPageState extends State<AstroStackInitialPage>
    with SingleTickerProviderStateMixin {
  late final controller = PageController();

  final planets = ["EARTH", "MARS"];

  late final TabController tabController =
      TabController(length: 3, vsync: this);

  double initialY = 0.0;
  double currentY = 0.0;
  final dragDistanceThreshold = 100.0;

  void onDraggedDown() async {}

  void onDraggedUp() async {}

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
              const Positioned(
                top: 290,
                left: 0,
                right: 0,
                child: Center(
                  child: Astronaut(),
                ),
              ),

              //EARTH.
              Positioned(
                top: 360,
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
                top: 320,
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

              //CONTROLLERS.
              Positioned(
                bottom: 120,
                left: 0,
                right: 0,
                child: Controllers(controller: controller),
              ),

              // WHEEL.
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
                    onTap: () async {},
                    child: const Text(
                      "EARTH",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 55,
                left: 0,
                right: 0,
                child: Center(
                  child: Pill(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
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

              //MOON.
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    "assets/images/moon.png",
                    width: 130,
                  ),
                ),
              ),
              Positioned(
                top: 135,
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
                top: 240,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "MOON",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 257,
                left: 0,
                right: 0,
                child: Center(
                  child: Pill(
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                left: 0,
                right: 0,
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

              // INDICATOR.
              Positioned(
                left: 0,
                right: 0,
                bottom: 200,
                child: Center(
                  child: Column(
                    children: [
                      for (int i = 0; i < 2; i++) ...[
                        AnimatedContainer(
                          width: i != 0 ? 8 : 6,
                          height: i != 0 ? 8 : 6,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: i != 0
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

              Positioned(
                top: 1000,
                left: 0,
                right: 0,
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

              Positioned(
                top: 20,
                left: -50,
                child: GestureDetector(
                  onTap: () {},
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
