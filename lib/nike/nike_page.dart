import 'package:droidcon23/nike/big_text.dart';
import 'package:droidcon23/nike/header.dart';
import 'package:droidcon23/nike/left_controller.dart';
import 'package:droidcon23/nike/nike_logo.dart';
import 'package:droidcon23/nike/right_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NikePage extends StatefulWidget {
  const NikePage({super.key});

  @override
  State<NikePage> createState() => _NikePageState();
}

class _NikePageState extends State<NikePage> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.grey[900]!,
              Colors.grey[800]!,
              Colors.grey[700]!,
              Colors.grey[500]!,
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 300,
          vertical: 100,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.grey[900]!,
                Colors.grey[800]!,
                Colors.grey[700]!,
                Colors.grey[500]!,
              ],
            ),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.grey[100]!.withOpacity(0.2),
              width: 30,
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: 100,
              ),
              ListView(
                controller: controller,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                children: [
                  const SizedBox(height: 100),
                  Transform.translate(
                    offset: const Offset(80, -45),
                    child: Transform.rotate(
                      angle: -0.5,
                      child: Image.asset(
                        "assets/images/nike_right_leg.png",
                        height: 250,
                      ),
                    ),
                  )
                      .animate(
                        adapter: ScrollAdapter(controller, end: 5000),
                      )
                      .moveY(end: -2000)
                      .rotate(end: -0.5)
                      .moveX(end: 2000),
                  const SizedBox(height: 90),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 50),
                          child: Transform.rotate(
                            angle: -0.4,
                            child: Image.asset(
                              "assets/images/nike_left_leg.png",
                              height: 250,
                            ),
                          ),
                        )
                            .animate(
                              adapter: ScrollAdapter(controller, end: 8000),
                            )
                            .moveY(end: -2000)
                            .rotate(end: -0.5)
                            .moveX(end: -2000),
                        Positioned(
                          right: 80,
                          top: -50,
                          child: Image.asset(
                            "assets/images/nike_air.png",
                            height: 150,
                          )
                              .animate(
                                adapter: ScrollAdapter(controller, end: 2000),
                              )
                              .moveY(end: -2000, curve: Curves.easeOut),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 500),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/wearing_nike1.png",
                        height: 550,
                      )
                          .animate(
                            adapter: ScrollAdapter(controller, end: 1000),
                          )
                          .moveY(
                            end: 140,
                            begin: 500,
                            curve: Curves.easeInCubic,
                          ),
                      Transform.translate(
                        offset: const Offset(70, 0),
                        child: const NikeLogo(),
                      ),
                      Expanded(
                        child: Transform.translate(
                          offset: const Offset(0, -30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const BigText("TUMBLED")
                                  .animate(
                                    adapter: ScrollAdapter(
                                      controller,
                                      end: 1000,
                                    ),
                                  )
                                  .moveX(end: -180),
                              const BigText("LEATHER.")
                                  .animate(
                                    adapter: ScrollAdapter(
                                      controller,
                                      end: 1000,
                                    ),
                                  )
                                  .moveX(
                                    begin: -500,
                                    end: 0,
                                    curve: Curves.easeInOut,
                                  ),
                              const BigText("PREMIUM")
                                  .animate(
                                    adapter: ScrollAdapter(
                                      controller,
                                      end: 1000,
                                    ),
                                  )
                                  .moveX(
                                    begin: -700,
                                    end: 0,
                                  ),
                              const BigText("CANVAS.")
                                  .animate(
                                    adapter: ScrollAdapter(
                                      controller,
                                      end: 1000,
                                    ),
                                  )
                                  .moveX(end: -200),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const BigText("EASY")
                                      .animate(
                                        adapter: ScrollAdapter(
                                          controller,
                                          end: 1000,
                                        ),
                                      )
                                      .moveX(end: -220, curve: Curves.easeOut),
                                  const BigText("TO")
                                      .animate(
                                        adapter: ScrollAdapter(
                                          controller,
                                          end: 1000,
                                        ),
                                      )
                                      .moveX(
                                        begin: -200,
                                        end: 0,
                                        curve: Curves.easeOut,
                                      ),
                                ],
                              ),
                              const BigText("STYLE")
                                  .animate(
                                    adapter: ScrollAdapter(
                                      controller,
                                      end: 1400,
                                    ),
                                  )
                                  .moveX(
                                    begin: -200,
                                    end: -100,
                                    curve: Curves.easeOut,
                                  ),
                              const BigText("COLORS.")
                                  .animate(
                                    adapter: ScrollAdapter(
                                      controller,
                                      end: 1400,
                                    ),
                                  )
                                  .moveX(
                                    begin: -200,
                                    end: -95,
                                    curve: Curves.easeOut,
                                  ),
                              const SizedBox(height: 100),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LeftController()
                                      .animate(
                                        adapter: ScrollAdapter(
                                          controller,
                                          end: 1200,
                                        ),
                                      )
                                      .moveX(
                                        begin: -200,
                                        end: -10,
                                        curve: Curves.easeOut,
                                      ),
                                  const RightController(),
                                  const SizedBox(width: 100),
                                  const Text(
                                    "001/4",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  )
                                      .animate(
                                        adapter: ScrollAdapter(
                                          controller,
                                          end: 1800,
                                        ),
                                      )
                                      .fadeIn(),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 65),
                        child: Container(
                          height: 350,
                          width: 516,
                          padding: const EdgeInsets.only(right: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                radianceLiving,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 50),
                              const Text(
                                "FIND YOURS!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 130,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                          .animate(
                            adapter: ScrollAdapter(controller, end: 3500),
                          )
                          .fadeIn(),
                      Stack(
                        children: [
                          Container(
                            height: 320,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                          )
                              .animate(
                                adapter: ScrollAdapter(controller, end: 2500),
                              )
                              .move(
                                end: const Offset(20, 20),
                                curve: Curves.easeOut,
                                duration: 2000.ms,
                                delay: 1500.ms,
                              ),
                          Image.asset(
                            "assets/images/wearing_nike2.png",
                            height: 320,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 250),
                  const Row(
                    children: [
                      Text(
                        "Nike Air Force 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "1982",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      for (final text in ["Story:", "Benefits:", "More:"])
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              right: text == "More:" ? 0 : 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Divider(),
                                Text(
                                  "Lorem " * 60,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 300),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const BigText("THIS"),
                                const BigText(
                                  "AF1",
                                  fontStyle: FontStyle.italic,
                                )
                                    .animate(
                                      adapter:
                                          ScrollAdapter(controller, end: 2800),
                                    )
                                    .moveX(
                                      delay: 1000.ms,
                                      end: 200,
                                      curve: Curves.easeInOut,
                                    ),
                              ],
                            ),
                            const BigText("MAKES")
                                .animate(
                                  adapter: ScrollAdapter(controller, end: 2800),
                                )
                                .moveX(
                                  delay: 1900.ms,
                                  end: 0,
                                  begin: 200,
                                  curve: Curves.easeInOut,
                                ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const BigText("A")
                                    .animate(
                                      adapter: ScrollAdapter(
                                        controller,
                                        end: 2800,
                                      ),
                                    )
                                    .moveX(
                                      delay: 1900.ms,
                                      end: -155,
                                      begin: 0,
                                      curve: Curves.easeInOut,
                                    ),
                                const BigText("SUBDUED"),
                              ],
                            ),
                            const BigText("STATEMENT,")
                                .animate(
                                  adapter: ScrollAdapter(
                                    controller,
                                    end: 2800,
                                  ),
                                )
                                .moveX(
                                  delay: 1900.ms,
                                  end: 140,
                                  begin: 0,
                                  curve: Curves.easeInOut,
                                ),
                            const BigText("ADDING")
                                .animate(
                                  adapter: ScrollAdapter(controller, end: 2800),
                                )
                                .moveX(
                                  delay: 2500.ms,
                                  end: 0,
                                  begin: 200,
                                  curve: Curves.easeInOut,
                                ),
                            const BigText("THE PERFECT")
                                .animate(
                                  adapter: ScrollAdapter(controller, end: 2840),
                                )
                                .moveX(
                                  delay: 2500.ms,
                                  end: 0,
                                  begin: 200,
                                  curve: Curves.easeInOut,
                                ),
                            Row(
                              children: [
                                const BigText("POLISH"),
                                const BigText("TO")
                                    .animate(
                                      adapter: ScrollAdapter(
                                        controller,
                                        end: 2850,
                                      ),
                                    )
                                    .moveX(
                                      delay: 2500.ms,
                                      end: 180,
                                      curve: Curves.easeInOut,
                                    ),
                              ],
                            ),
                            const BigText("YOUR 'FIT")
                                .animate(
                                  adapter: ScrollAdapter(controller, end: 2890),
                                )
                                .moveX(
                                  delay: 3500.ms,
                                  end: 200,
                                  begin: 100,
                                  curve: Curves.easeInOut,
                                ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/images/last_shoe2.png",
                        height: 300,
                      )
                          .animate(
                            adapter: ScrollAdapter(controller, end: 2800),
                          )
                          .rotate(
                            begin: 0.9,
                            end: 0,
                            delay: 3500.ms,
                          )
                          .moveY(
                            delay: 3500.ms,
                            end: 300,
                            begin: 0,
                            curve: Curves.easeInOut,
                          ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              const Header(),
            ],
          ),
        ),
      ),
    );
  }

  String get radianceLiving {
    return "The radiance lives on in the Nike Air Force 1\n'07, the b-ball OG that puts a fresh spin on\nwhat you know best: durably stiched\noverlays, clean finishes and the perfect\namount of flash to make you shine.";
  }
}
