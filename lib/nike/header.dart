import 'package:droidcon23/nike/nike_logo.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: const Row(
        children: [
          NikeLogo(),
          SizedBox(width: 100),
          Text("NEW & FEATURED", style: TextStyle(color: Colors.white)),
          SizedBox(width: 30),
          Text("MEN", style: TextStyle(color: Colors.white)),
          SizedBox(width: 30),
          Text("WOMEN", style: TextStyle(color: Colors.white)),
          Spacer(),
          Text("HELP", style: TextStyle(color: Colors.white)),
          SizedBox(width: 30),
          Text("FIND A STORE", style: TextStyle(color: Colors.white)),
          SizedBox(width: 30),
          Icon(
            Icons.dashboard,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
