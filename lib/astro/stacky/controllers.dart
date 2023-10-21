import 'package:flutter/material.dart';

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