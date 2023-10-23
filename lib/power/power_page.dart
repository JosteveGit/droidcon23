import 'package:flutter/material.dart';

class PowerPage extends StatefulWidget {
  const PowerPage({super.key});

  @override
  State<PowerPage> createState() => _PowerPageState();
}

class _PowerPageState extends State<PowerPage> {
  bool hasTappedLearnMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.black,
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 500),
                scale: hasTappedLearnMore ? 0 : 1,
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: hasTappedLearnMore ? 0 : 1,
                  curve: Curves.easeInOut,
                  child: const Center(
                    child: Icon(
                      Icons.lightbulb,
                      size: 150,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                left: 0,
                right: 0,
                top: hasTappedLearnMore ? 80 : 500,
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 500),
                    style: TextStyle(
                      fontSize: hasTappedLearnMore ? 15 : 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    child: const Text(
                      "Power Ledger",
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 550,
                child: Center(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: hasTappedLearnMore ? 0 : 1,
                    curve: Curves.easeInOut,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: hasTappedLearnMore ? 0 : 1,
                      curve: Curves.easeInOut,
                      child: const Text(
                        "Create our energy future together",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 700,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 500),
                  scale: hasTappedLearnMore ? 0 : 1,
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: hasTappedLearnMore ? 0 : 1,
                    curve: Curves.easeInOut,
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            hasTappedLearnMore = !hasTappedLearnMore;
                          });
                        },
                        child: const Text(
                          "LEARN MORE",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: hasTappedLearnMore ? 120 : 1000,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  color: Colors.white,
                  height: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("Lorem" * 100),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            hasTappedLearnMore = !hasTappedLearnMore;
                          });
                        },
                        child: const Text("Close"),
                      ),
                    ],
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
