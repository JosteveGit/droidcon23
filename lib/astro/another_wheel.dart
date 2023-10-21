import 'package:flutter/material.dart';

class AnotherWheel extends StatefulWidget {
  const AnotherWheel({super.key});

  @override
  State<AnotherWheel> createState() => _AnotherWheelState();
}

class _AnotherWheelState extends State<AnotherWheel> {
  late final PageController controller = PageController(viewportFraction: 0.35);

  double page = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        page = controller.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(0, 0),
          child: Container(
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
          ),
        ),
        SizedBox(
          width: 350,
          height: 400,
          child: PageView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              double alignmentFactor = (index - page).abs();

              double yOffset = (alignmentFactor * 50);
              double xOffset = (alignmentFactor * 50);

              double size = 20 - (alignmentFactor * 10);

              return Transform.translate(
                offset: const Offset(0, 76),
                child: Transform.translate(
                  offset: Offset(0, yOffset),
                  child: Align(
                    child: Container(
                      width: size,
                      height: size,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
