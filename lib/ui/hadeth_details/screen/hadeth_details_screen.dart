import 'package:flutter/material.dart';
import 'package:islami_c19/model/hadeth_model.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManager.goldColor),
        title: Text(
          "Hadith ${hadeth.number}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.goldColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AssetsManager.leftCorner),
                          Image.asset(AssetsManager.rightCorner),
                        ],
                      ),
                      Text(
                        hadeth.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 2.5,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: ColorsManager.goldColor
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.suraMosque)
        ],
      ),
    );
  }
}
