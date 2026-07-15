import 'package:flutter/material.dart';
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
          PageView.builder(
          controller: controller,
            itemCount: onboardingPages.length,
            itemBuilder: (context , index){
            return Column(children: [
              Image.asset(onboardingPages[index].Image),
              Text(onboardingPages[index].title),
              Text(onboardingPages[index].message),

            ],);
            }
        ),
          Row(children: [

          ],)
        ]
      ),
    );
  }
}