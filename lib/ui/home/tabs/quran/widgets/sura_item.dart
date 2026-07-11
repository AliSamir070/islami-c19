import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/routes_manager.dart';
import 'package:islami_c19/model/sura_model.dart';

class SuraItem extends StatelessWidget {
  SuraModel sura;
  SuraItem(this.sura);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.suraDetailsRouteName,arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetsManager.suraNumber),
              Text(sura.suraNumber.toString(),style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),)
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.suraNameEn,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: ColorsManager.whiteColor
                ),),
                Text("${sura.versesNumber} Verses",style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: ColorsManager.whiteColor
                ),)
              ],
            ),
          ),
          Text(sura.suraNameAr,style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: ColorsManager.whiteColor
          ),),
        ],
      ),
    );
  }
}
