import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RocketsPage extends StatefulWidget {
  const RocketsPage({super.key});

  @override
  State<RocketsPage> createState() => _RocketsPageState();
}

class _RocketsPageState extends State<RocketsPage> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "🚀",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                      .animate(adapter: ScrollAdapter(controller))
                      .rotate(
                        begin: 0,
                        end: -0.2,
                        duration: 3.seconds,
                      )
                      .moveX(
                        begin: 0,
                        end: 150,
                        duration: 3.seconds,
                      )
                      .scaleXY(
                        end: 1.6,
                        duration: 3.seconds,
                      )
                      .moveY(
                        begin: 700,
                        end: 0,
                        duration: 3.seconds,
                      )
                      .shake(
                        hz: 5,
                        duration: 3.seconds,
                      ),
                  const SizedBox(width: 10),
                  const Text(
                    "Rockets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  child: Text(
                    rocketMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get rocketMessage {
    return """
The story of rockets is not just a recent one; it's intertwined with the very story of human progress. From the rudimentary rockets used in ancient China, which were essentially enhanced fireworks, to the mighty Saturn V that ferried humans to the Moon, and to the reusability mastered by SpaceX's Falcon rockets, these devices represent humanity's aspirations, intelligence, and courage.

Let's begin by understanding what a rocket is, fundamentally. At its core, a rocket is a vehicle, missile, or aircraft propelled by an engine that exudes thrust from a high-speed exhaust jet sent out the rear. This principle is eloquently encapsulated in Newton's third law of motion: for every action, there's an equal and opposite reaction. Rocket engines work by expelling propellant at high speeds, pushing the rocket forward.

Rockets have been used for various purposes: warfare, research, communication, exploration, and even potential future tourism. Each of these uses has propelled different focuses in rocket design, fuel efficiency, sustainability, payload capacity, and safety measures. The scientific principles governing these areas are complex and numerous, involving sophisticated understandings of aerodynamics, thermodynamics, materials science, orbital mechanics, and environmental science, among others.

The journey to making rockets sophisticated and reliable has been a long one. Early rocketry was primarily used in warfare, with significant developments made during World War II with the likes of Germany's V2 rockets. The post-war period saw these technologies repurposed during the Cold War, leading to the space race between the United States and the Soviet Union. This period saw the launch of the first artificial satellite, Sputnik, by the Soviet Union, and eventually, the Apollo missions by the USA, which famously culminated in Neil Armstrong setting foot on the Moon in 1969.

One of the key challenges of rocketry is the necessity of escaping Earth's gravity. To reach orbit, a rocket must achieve sufficient velocity, the required speed and direction, which depends on the altitude of the desired orbit. Achieving this demands a colossal amount of energy, requiring efficient engines and propellants, as well as minimizing the weight of the rocket itself—hence the use of materials like titanium and carbon composites in modern designs.

In the realm of propellants, there have been numerous approaches. Chemical rockets have been the go-to, using high-energy propellants that react to produce hot gas expelled to generate thrust. There's a myriad of choices in chemical propellants, from liquid oxygen and hydrogen that powered the Space Shuttle's main engines to the kerosene RP-1 used in SpaceX's Falcon rockets.

One of the more recent revolutions in rocketry is the concept of reusability. Traditionally, rocket components were discarded after each launch, often burning up upon reentry or, like the Space Shuttle's solid rocket boosters, requiring extensive refurbishment. SpaceX dramatically altered this paradigm, first successfully landing their Falcon 9 rocket stage in 2015. This reusability is a game-changer in reducing costs and increasing the frequency of launches.

Looking to the future, there's much on the horizon. NASA's Space Launch System (SLS) represents the next generation of super heavy-lift launch vehicles, designed to enable deep space exploration missions. Companies like SpaceX and Blue Origin are not just looking at commercial launches and satellite deployments but envisioning human colonization of other planets.

The field of rocketry is also seeing an influx of discussions about environmental concerns, as traditional rocket launches are energy-intensive and can release various pollutants into the atmosphere. This has led to increased research into more sustainable propellants and launch methods.

Moreover, the concept of space tourism is becoming a reality, with companies like Virgin Galactic and Blue Origin taking steps toward commercial suborbital spaceflights for private individuals. This represents a whole new frontier in both rocketry and human experience.

In conclusion, rockets are a testament to human ingenuity and our perpetual desire to explore, understand, and expand our boundaries. They're complex machines, born from centuries of scientific advancement, and continue to drive numerous industries forward. As we stand at the precipice of further space exploration, possibly seeing humans on Mars within our lifetime, rockets will be at the heart of these endeavors, continuing to inspire awe, curiosity, and dreams of what lies beyond.
""";
  }
}
