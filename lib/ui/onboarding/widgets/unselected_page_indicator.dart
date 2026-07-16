import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';

class UnselectedPageIndicator extends StatelessWidget {
  const UnselectedPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: ColorsManager.greyColor,
      borderRadius: BorderRadius.circular(27),
    ),width: 7, height: 7,);;
  }
}
