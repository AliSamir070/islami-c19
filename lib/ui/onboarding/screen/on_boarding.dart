import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/routes_manager.dart';
import 'package:islami_c19/core/resources/strings_manager.dart';
import 'package:islami_c19/ui/onboarding/widgets/on_boarding_button.dart';
import 'package:islami_c19/ui/onboarding/widgets/on_boarding_model.dart';
import 'package:islami_c19/ui/onboarding/widgets/selected_page_indicator.dart';
import 'package:islami_c19/ui/onboarding/widgets/unselected_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController controller = PageController(initialPage: 0);

  int currentPage = 0;

  final List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
      image: AssetsManager.onBoarding1,
      text1: StringsManager.welcome,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding2,
      text1: StringsManager.welcome,
      text2: StringsManager.welcome2,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding3,
      text1: StringsManager.reading,
      text2: StringsManager.reading2,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding4,
      text1: StringsManager.bearish,
      text2: StringsManager.bearish2,
    ),
    OnBoardingModel(
      image: AssetsManager.onBoarding5,
      text1: StringsManager.quranRadio,
      text2: StringsManager.quranRadio2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 50,
            children: [
              Image.asset(
                AssetsManager.imageHeader,
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(onBoarding[index].image),
                          Text(
                            onBoarding[index].text1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsManager.goldColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            onBoarding[index].text2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsManager.goldColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: onBoarding.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage == 0
                      ? const SizedBox(width: 60,)
                      : OnBoardingButton(
                    title: StringsManager.back,
                    action: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  Row(
                    spacing: 11,
                    children: List.generate(
                      onBoarding.length,
                          (index) => currentPage == index
                          ? const SelectedPageIndicator()
                          : const UnselectedPageIndicator(),
                    ),
                  ),
                  OnBoardingButton(
                    title: currentPage == onBoarding.length - 1
                        ? StringsManager.finish
                        : StringsManager.next,
                    action: () {
                      if (currentPage == onBoarding.length - 1) {
                        Navigator.of(context).pushReplacementNamed(RoutesManager.homeRouteName);
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
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
