
import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/ui/home/screen/home_screen.dart';

import '../../core/remote/local/prefs_manager.dart';

class ScreenOnboarding extends StatefulWidget {

  @override
  State<ScreenOnboarding> createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  final PageController pageController = PageController();

  int currentPage = 0;

  final List<OnboardingData> pages =
      [
        OnboardingData(title: "Welcome To Islami App", description: null, image: AssetsManager.onboardingWelcome),
        OnboardingData(title: "Welcome To Islami", description: "We Are Very Excited To Have You In Our Community", image: AssetsManager.onboardingMosque),
        OnboardingData(title: "Reading The Quran", description: "Read, and your Lord is the Most Generous", image: AssetsManager.onboardingQuran),
        OnboardingData(title: "Bearish", description: "Praise the name of your Lord, the Most High", image: AssetsManager.onboardingBearish),
        OnboardingData(title: "Holy Quran Radio", description: "You can listen to the Holy Quran Radio through the application for free and easily", image: AssetsManager.onboardingRadio),
      ];

  bool get isFirstPage => currentPage ==0;

  bool get isLastPage => currentPage == pages.length - 1;

  void goNext()
  {
    if(!isLastPage)
      {
        pageController.nextPage(duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,);
      }
    else
      {
        finishOnboarding();
      }
  }

  void _goBack() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> finishOnboarding() async{
    await PrefsManager.setOnboardingSeen();
    if(!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 8),
            child: Center(
              child: Image.asset(
                AssetsManager.imageHeader,
                height: 110,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemBuilder: (context, index) {
                final page = pages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 280,
                        child: Image.asset(
                          page.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        page.title,
                        style: const TextStyle(
                          color: ColorsManager.goldColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (page.description != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          page.description!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isFirstPage
                    ? const SizedBox(width: 48)
                    : TextButton(
                  onPressed: _goBack,
                  child: const Text('Back',
                      style: TextStyle(color: Colors.grey)),
                ),
                Row(
                  children: List.generate(pages.length, (index) {
                    final active = currentPage == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      height: 6,
                      width: active ? 18 : 6,
                      decoration: BoxDecoration(
                        color: active ? ColorsManager.goldColor: ColorsManager.blackColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                TextButton(
                  onPressed: goNext,
                  child: Text(
                    isLastPage ? 'Finish' : 'Next',
                    style: const TextStyle(
                        color: ColorsManager.goldColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),

    );
  }
}

class OnboardingData {
  final String title;
  final String? description;
  final String image;

  OnboardingData(
      {required this.title, required this.description, required this.image});
}
