import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class RoundedText extends StatelessWidget {
  const RoundedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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
    );
  }
}


class Controllers extends StatelessWidget {
  const Controllers({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}