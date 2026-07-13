import 'package:flutter/material.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../model/onboarding_model.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.pages,
    required this.onPageChanged,
  });

  final PageController pageController;

  final List<OnboardingModel> pages;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (int page) {
        onPageChanged(page);
      },
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return  Column(
          children: [
            Image.asset(pages[index].image),
            const SizedBox(height: 20),
            Text(
              pages[index].title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorsManager.goldColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (pages[index].description != null)
              Text(
                pages[index].description!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsManager.goldColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        );
      },
    );
  }
}
