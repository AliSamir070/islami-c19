import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';

class OnBoardingButton extends StatelessWidget {
  final String title;
  final VoidCallback? action;

  OnBoardingButton({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Text(
          title,
          style: TextStyle(
            color: ColorsManager.goldColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
