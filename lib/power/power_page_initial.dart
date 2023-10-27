import 'package:flutter/material.dart';

class PowerPageInitial extends StatefulWidget {
  const PowerPageInitial({super.key});

  @override
  State<PowerPageInitial> createState() => _PowerPageInitialState();
}

class _PowerPageInitialState extends State<PowerPageInitial> {
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
                scale: hasTappedLearnMore ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: AnimatedOpacity(
                  opacity: hasTappedLearnMore ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
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
                child: const Center(
                  child: Text(
                    "Power Ledger",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 550,
                child: AnimatedScale(
                  scale: hasTappedLearnMore ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: hasTappedLearnMore ? 0 : 1,
                    duration: const Duration(milliseconds: 500),
                    child: const Center(
                      child: Text(
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
                top: hasTappedLearnMore ? 80 : 700,
                child: AnimatedOpacity(
                  opacity: hasTappedLearnMore ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
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
              AnimatedPositioned(
                top: hasTappedLearnMore ? 120 : 1000,
                left: 0,
                right: 0,
                duration: const Duration(milliseconds: 500),
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
