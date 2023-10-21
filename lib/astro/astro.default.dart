import 'package:droidcon23/astro/wheel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AstroDefaultPage extends StatefulWidget {
  const AstroDefaultPage({super.key});

  @override
  State<AstroDefaultPage> createState() => _AstroDefaultPageState();
}

class _AstroDefaultPageState extends State<AstroDefaultPage>
    with TickerProviderStateMixin {
  late final controller = PageController();
  late final astronautController = AnimationController(
    vsync: this,
    duration: 900.ms,
  );
  late final earthController = AnimationController(
    vsync: this,
    duration: 1500.ms,
  );

  late final moonFadeController = AnimationController(
    vsync: this,
    duration: 1000.ms,
  );

  late final moonOtherController = AnimationController(
    vsync: this,
    duration: 1000.ms,
  );

  late final quickFadeControllers = AnimationController(
    vsync: this,
    duration: 300.ms,
  );

  late final earthCTAController = AnimationController(
    vsync: this,
    duration: 1500.ms,
  );

  Color ctaColor = Colors.black;

  @override
  void dispose() {
    astronautController.dispose();
    super.dispose();
  }

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
        child: Column(
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
                    offset: const Offset(0, 290),
                    child: Stack(
                      children: [
                        Center(
                          child: ScaleTransition(
                            scale: astronautController.drive(
                              Tween(
                                begin: 1,
                                end: 10,
                              )..chain(CurveTween(curve: Curves.easeInCubic)),
                            ),
                            child: Image.asset(
                              'assets/images/astronaut1.png',
                              width: 300,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -40),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SlideTransition(
                                position: earthController.drive(
                                  Tween(
                                    begin: Offset.zero,
                                    end: const Offset(0, 0.9),
                                  ),
                                ),
                                child: ScaleTransition(
                                  scale: earthController.drive(
                                    Tween(
                                      begin: 1,
                                      end: 3.5,
                                    ),
                                  ),
                                  child: Center(
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
                                  )),
                                ),
                              ),
                              SlideTransition(
                                position: earthController.drive(
                                  Tween(
                                    begin: Offset.zero,
                                    end: const Offset(0, 0.9),
                                  ),
                                ),
                                child: ScaleTransition(
                                  scale: earthController.drive(
                                    Tween(
                                      begin: 1,
                                      end: 3.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/grad.png",
                                      width: 189,
                                      height: 189,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SlideTransition(
                          position: moonOtherController.drive(
                            Tween(
                              begin: Offset.zero,
                              end: const Offset(0, -0.1),
                            ),
                          ),
                          child: ScaleTransition(
                            scale: moonOtherController.drive(
                              Tween(
                                begin: 1,
                                end: 1.8,
                              ),
                            ),
                            child: FadeTransition(
                                opacity: moonFadeController.drive(
                                  Tween(
                                    begin: 0,
                                    end: 1,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(0, -50),
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
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FadeTransition(
              opacity: quickFadeControllers.drive(
                Tween(
                  begin: 1,
                  end: 0,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(0, 290),
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
                ),
              ),
            ),
            SlideTransition(
              position: quickFadeControllers.drive(
                Tween(
                  begin: Offset.zero,
                  end: const Offset(0, 90),
                ),
              ),
              child: FadeTransition(
                opacity: quickFadeControllers.drive(
                  Tween(
                    begin: 1,
                    end: 0.5,
                  ),
                ),
                child: Transform.translate(
                    offset: const Offset(0, 290),
                    child: Wheel(
                      onSelected: (index) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInCubic,
                        );
                      },
                    )),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 30),
              child: Column(
                children: [
                  SlideTransition(
                    position: earthCTAController.drive(
                      Tween(
                        begin: Offset.zero,
                        end: const Offset(0, -2),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        print("how far?");
                        astronautController.forward();
                        earthController.forward();
                        quickFadeControllers.forward();
                        earthCTAController.forward();

                        setState(() {
                          ctaColor = Colors.white;
                        });

                        await Future.delayed(const Duration(milliseconds: 800));
                        moonFadeController.forward();
                        moonOtherController.forward();
                      },
                      child: Container(
                        color: Colors.purple,
                        child: Text(
                          "EARTH",
                          style: TextStyle(
                            fontSize: 15,
                            color: ctaColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: quickFadeControllers.drive(
                      Tween(
                        begin: 1,
                        end: 0,
                      ),
                    ),
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Is the third planet from the Sun and the only object in \n the Universe known to harbor life.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: ctaColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          print("Read more");
                        },
                        child: Text(
                          "Read more",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            color: ctaColor,
                          ),
                        ),
                      )
                    ],
                  )
                  // .animate(target: target)
                  // .tint(color: Colors.white)
                  // .fade(
                  //   begin: 0,
                  //   end: 1,
                  //   duration: 500.ms,
                  //   delay: 1000.ms,
                  // )
                  // .moveY(
                  //   begin: 1,
                  //   end: -30,
                  //   duration: 500.ms,
                  //   delay: 1000.ms,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
