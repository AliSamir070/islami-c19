import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/data/onboarding%20data.dart';

class Onboardingsliders extends StatefulWidget {
  const Onboardingsliders({super.key});

  @override
  State<Onboardingsliders> createState() => _OnboardingslidersState();
}

class _OnboardingslidersState extends State<Onboardingsliders> {
  final PageController controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingPages.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  spacing: 10,
                  children: [
                    Image.asset(onboardingPages[index].Image),
                    Text(
                      onboardingPages[index].title,
                      style: TextStyle(color: ColorsManager.goldColor),
                    ),
                    Text(
                      onboardingPages[index].message,
                      style: TextStyle(color: ColorsManager.goldColor),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex == 0
                    ? const SizedBox(width: 40)
                    : InkWell(
                        onTap: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                Row(
                  children: List.generate(
                    onboardingPages.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: currentIndex == index ? 18 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? ColorsManager.goldColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (currentIndex < onboardingPages.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == onboardingPages.length - 1
                        ? "Finish"
                        : "Next",
                    style: TextStyle(
                      color: ColorsManager.goldColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
