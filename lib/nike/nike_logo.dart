import 'package:flutter/material.dart';

class NikeLogo extends StatefulWidget {
  const NikeLogo({super.key});

  @override
  State<NikeLogo> createState() => _NikeLogoState();
}

class _NikeLogoState extends State<NikeLogo> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/nike.png",
      width: 80,
    );
  }
}
