import 'package:droidcon23/astro/stacky/astro.animate.dart';
import 'package:droidcon23/astro/stacky/astro.stack.dart';
import 'package:droidcon23/nike/nike_page.dart';
import 'package:droidcon23/power/power_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const PowerPage(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.translate(
                offset: const Offset(0, 200),
                child: GestureDetector(
                  onTap: () {
                    print("hi");
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                    child: const Text("Hi"),
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

class ATest extends StatefulWidget {
  const ATest({super.key});

  @override
  State<ATest> createState() => _ATestState();
}

class _ATestState extends State<ATest> {
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
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(0, 250),
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
        ),
      ),
    );
  }
}
