import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/model/sebha_model.dart';

class SebhaItem extends StatefulWidget {
  const SebhaItem({super.key});

  @override
  State<SebhaItem> createState() => _SebhaItemState();
}

class _SebhaItemState extends State<SebhaItem> {
  static const int maxCount = 30;

  // Only 4 phrases -- fill these in, they cycle in order and loop back to the first.
  final List<SebhaModel> phrases = [
    SebhaModel(phrase: 'سبحان الله'), // phrase 1
    SebhaModel(phrase: 'الحمدلله'), // phrase 2
    SebhaModel(phrase: 'لا اله الا الله'), // phrase 3
    SebhaModel(phrase: 'الله أكبر'), // phrase 4
  ];

  int count = 0;
  int phraseIndex = 0;
  int totalTaps = 0; // drives rotation only, never resets

  void _onTapSebha() {
    setState(() {
      count++;
      totalTaps++;
      if (count >= maxCount) {
        count = 0;
        phraseIndex = (phraseIndex + 1) % phrases.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double ringSize = screenWidth * 0.68;

    return Center(
      child: InkWell(
        onTap: _onTapSebha,
        child: SizedBox(
          width: ringSize,
          height: ringSize * 1.15,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Rotating bead ring
              Positioned(
                top: ringSize * 0.15,
                child: AnimatedRotation(
                  turns: totalTaps / maxCount,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  child: SvgPicture.asset(
                    AssetsManager.sebhaBody,
                    width: ringSize,
                    height: ringSize,
                  ),
                ),
              ),

              // Fixed head/tassel -- does not rotate
              Image.asset(
                AssetsManager.sebhaHead,
                width: ringSize * 0.22,
              ),

              // Center phrase + counter
              Positioned(
                top: ringSize * 0.15 + ringSize / 2 - 30,
                child: SizedBox(
                  width: ringSize * 0.65,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        phrases[phraseIndex].phrase,
                        style: const TextStyle(
                          color: ColorsManager.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$count',
                        style: const TextStyle(
                          color: ColorsManager.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
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