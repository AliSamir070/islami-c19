import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/azkar/tasabeh.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> with TickerProviderStateMixin {
  List<Tasabeh> tasabeh = [];
  int currentTasabehIndex = 0;
  int currentCount = 0;
  double angle = 0;

  Tasabeh get currentTasabeh => tasabeh[currentTasabehIndex];

  @override
  void initState() {
    super.initState();
    tasabeh = sebhaContent.map((e) => Tasabeh.fromMap(e)).toList();
  }

  void onSebhaTap() {
    angle += pi / 18;

    if (currentCount < currentTasabeh.count) {
      currentCount++;
    }

    if (currentCount >= currentTasabeh.count) {
      currentCount = 0;
      currentTasabehIndex = (currentTasabehIndex + 1) % tasabeh.length;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.imageHeader,
                  width: 0.75 * screenWidth,
                  height: 0.15 * screenHeight,
                ),
              ),
              SizedBox(height: 120),

              InkWell(
                onTap: onSebhaTap,
                child: Stack(
                  clipBehavior: .none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -72,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        AssetsManager.sebhaHeader,
                        width: 0.6 * screenWidth,
                        height: 0.1 * screenHeight,
                      ),
                    ),

                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: angle),
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      builder: (_, value, child) {
                        return Transform.rotate(angle: value, child: child);
                      },
                      child: Image.asset(AssetsManager.sebhaBody),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 0.6 * screenWidth,
                          child: Text(
                            currentTasabeh.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: ColorsManager.whiteColor,
                            ),
                          ),
                        ),
                        Text(
                          currentCount.toString(),
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
