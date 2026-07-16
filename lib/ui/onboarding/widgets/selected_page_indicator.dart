import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';

class SelectedPageIndicator extends StatelessWidget {
  const SelectedPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: ColorsManager.goldColor,
      borderRadius: BorderRadius.circular(27),
    ),width: 18, height: 7,);
  }
}
