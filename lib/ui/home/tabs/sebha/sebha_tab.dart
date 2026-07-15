import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/ui/home/tabs/sebha/widgets/sebha.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.backgroundsebha),
        ),
      ),
      child: SafeArea(
        child: Column(
          spacing: 10,
          children: [
            Image.asset(AssetsManager.imageHeader),
            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى " , style: TextStyle(
              fontWeight:FontWeight.w700 ,
              fontSize: 36,
              color: ColorsManager.whiteColor
            ),),
            Sebha(),
          ],
        ),
      ),
    );
  }
}
