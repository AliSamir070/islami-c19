import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/strings_manager.dart';
import 'package:islami_c19/ui/home/tabs/sebha/widgets/tasbihat.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 1;
  int index = 0;
  double rotationAngle = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      rotationAngle += 1/30;
      if (counter > 30) {
        counter = 1;
        index++;
      }
      if (index == 4) {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            Image.asset(
              AssetsManager.imageHeader,
              height: screenHeight * 0.18,
              width: screenWidth * 0.75,
              fit: BoxFit.fill,
            ),
            Text(
              StringsManager.tasbihHeader,
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              children: [
                Image.asset(
                  AssetsManager.sebhaHead,
                  fit: BoxFit.fill,
                  width: screenWidth * 0.33,
                  height: screenHeight * 0.1,
                ),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: rotationAngle,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          child: Image.asset(
                            AssetsManager.sebhaBody,
                            fit: BoxFit.fitHeight,
                            height: screenHeight * 0.4,
                          ),
                        ),
                      Column(
                        children: [
                          Tasbihat(onTap: incrementCounter,
                          index: index,
                          ),
                          Text("$counter",style:
                          TextStyle(
                              fontSize: 36,
                              color: ColorsManager.whiteColor,
                              fontWeight: FontWeight.w700
                          )
                            ,),
                        ],
                      )
                    ],),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
