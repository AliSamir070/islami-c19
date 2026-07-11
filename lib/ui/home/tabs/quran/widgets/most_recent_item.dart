import 'package:flutter/material.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 17,
        right: 6,
        top: 7,
        bottom: 7
      ),
      decoration: BoxDecoration(
        color: ColorsManager.goldColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Al-Anbiya",style: TextStyle(
                color: ColorsManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text("الأنبياء",style: TextStyle(
                color: ColorsManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text("112 Verses",style: TextStyle(
                color: ColorsManager.blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),),
            ],
          ),
          Image.asset(AssetsManager.mostRecentBack)
        ],
      ),
    );
  }
}
