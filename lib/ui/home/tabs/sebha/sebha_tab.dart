import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/ui/home/tabs/sebha/widgets/sebha_item.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBackground),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          colorFilter: ColorFilter.mode(
            ColorsManager.blackColor.withValues(alpha: 0.6),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            spacing: 55,
            children: [
              Image.asset(
                AssetsManager.imageHeader,
                height: height * 0.15,
                fit: BoxFit.fitHeight,
              ),
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                  color: ColorsManager.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SebhaItem()),
            ],
          ),
        ),
      ),
    );
  }
}