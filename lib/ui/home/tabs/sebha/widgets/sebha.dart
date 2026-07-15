import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;

  int zekrIndex = 0;

  double angle = 0;

  List<String> azkar = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ لِلَّهِ",
    "اللَّهُ أَكْبَرُ",
  ];
  void onSebhaTap() {
    setState(() {
      angle += 0.10;
      counter++;
      if (counter == 30) {
        counter = 0;

        zekrIndex++;

        if (zekrIndex == azkar.length) {
          zekrIndex = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Transform.translate(
          offset: const Offset(0, -25),
          child: Image.asset(AssetsManager.sebhahead, width: 100, height: 100),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: GestureDetector(
            onTap: onSebhaTap,
            child: Transform.rotate(
              angle: angle,
              child: Image.asset(AssetsManager.sebhabody),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 160),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                azkar[zekrIndex],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: ColorsManager.whiteColor,
                ),
              ),

              SizedBox(height: 8),

              Text(
                "$counter",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: ColorsManager.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
