import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/routes_manager.dart';
import 'package:islami_c19/ui/onboarding/screen/widgets/onboarding_page.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static final String routeName = 'onboarding_screen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AssetsManager.onboardingWelcome,
      title: 'Welcome To Islmi App',
    ),
    OnboardingModel(
      image: AssetsManager.onboardingMosque,
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingModel(
      image: AssetsManager.onboardingBook,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      image: AssetsManager.onboardingHands,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      image: AssetsManager.onboardingMic,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(horizontal: 16),
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
              SizedBox(height: 20),
              Expanded(
                child: OnboardingPageView(
                  pageController: pageController,
                  pages: pages,
                  onPageChanged: (int page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  if (currentPage > 0)
                    InkWell(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),

                      onTap: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        StringsManager.back,
                        style: const TextStyle(
                          color: ColorsManager.goldColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const Spacer(),
                  Row(
                    children: List.generate(pages.length, (index) {
                      return Container(
                        width: currentPage == index ? 18 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          shape: currentPage == index
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          borderRadius: currentPage == index
                              ? BorderRadius.circular(28)
                              : null,
                          color: currentPage == index
                              ? ColorsManager.goldColor
                              : ColorsManager.grayColor,
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  InkWell(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    onTap: () {
                      if (currentPage < pages.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.of(context).pushNamed(
                          RoutesManager.homeRouteName,
                        );
                      }
                    },
                    child: Text(
                      currentPage != pages.length - 1
                          ? StringsManager.next
                          : StringsManager.finish,
                      style: const TextStyle(
                        color: ColorsManager.goldColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
