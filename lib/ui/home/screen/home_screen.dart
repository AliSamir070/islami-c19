import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/strings_manager.dart';
import 'package:islami_c19/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_c19/ui/home/tabs/quran/quran_tab.dart';
import 'package:islami_c19/ui/home/tabs/radio/radio_tab.dart';
import 'package:islami_c19/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_c19/ui/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          backgroundColor: ColorsManager.goldColor,
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
           return TextStyle(
             color: ColorsManager.whiteColor,
             fontSize: 12,
             fontWeight: FontWeight.w700
           );
          },),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          indicatorColor: ColorsManager.blackColor.withValues(alpha: 0.6),
          destinations: [
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.quranTab,colorFilter: ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn),),
                selectedIcon: SvgPicture.asset(AssetsManager.quranTab,colorFilter: ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn),),
                label: StringsManager.quran
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.hadethTab,colorFilter: ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn),),
                selectedIcon: SvgPicture.asset(AssetsManager.hadethTab,colorFilter: ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn),),
                label: StringsManager.hadith
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.sebhaTab,colorFilter: ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn),),
                selectedIcon: SvgPicture.asset(AssetsManager.sebhaTab,colorFilter: ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn),),
                label: StringsManager.sebha
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.radioTab,colorFilter: ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn),),
                selectedIcon: SvgPicture.asset(AssetsManager.radioTab,colorFilter: ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn),),
                label: StringsManager.radio
            ),
            NavigationDestination(
                icon: SvgPicture.asset(AssetsManager.timeTab,colorFilter: ColorFilter.mode(ColorsManager.blackColor, BlendMode.srcIn),),
                selectedIcon: SvgPicture.asset(AssetsManager.timeTab,colorFilter: ColorFilter.mode(ColorsManager.whiteColor, BlendMode.srcIn),),
                label: StringsManager.time
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}
