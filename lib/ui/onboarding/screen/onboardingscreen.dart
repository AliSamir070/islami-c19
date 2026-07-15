

import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';

import '../widgets/onboardingsliders.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          spacing: 20,
          children: [
            Image.asset(AssetsManager.imageHeader),
            Expanded(
              child: Onboardingsliders(),
            ),
          ],
        ),
      ),
    );
  }
}
