import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/strings_manager.dart';
import 'package:islami_c19/model/sura_model.dart';
import 'package:islami_c19/ui/home/tabs/quran/widgets/most_recent_item.dart';
import 'package:islami_c19/ui/home/tabs/quran/widgets/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.quranBack),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TextFormField(
              enabled: true,
              decoration: InputDecoration(
                fillColor: ColorsManager.blackColor.withValues(alpha: 0.7),
                filled: true,
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 55,
                  maxWidth: 55
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    AssetsManager.quranTab,
                    height: 40,
                    width: 40,
                    colorFilter: ColorFilter.mode(
                      ColorsManager.goldColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorsManager.goldColor),
                ),
                hintText: StringsManager.suraName,
                hintStyle: TextStyle(
                  color: ColorsManager.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(StringsManager.mostRecently,style: TextStyle(
              color: ColorsManager.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder:(context, index) => SizedBox(width: 10,) ,
                  itemBuilder: (context, index) =>MostRecentItem() ,
              ),
            ),
            SizedBox(height: 10,),
            Text(StringsManager.surasList,style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),),
            SizedBox(height: 10,),
            Expanded(
              flex: 2,
              child: ListView.separated(
                  itemBuilder: (context, index) => SuraItem(SuraModel.surasList[index]),
                  separatorBuilder: (context, index) => Divider(color: ColorsManager.whiteColor,),
                  itemCount: SuraModel.surasList.length
              ),
            )
          ],
        ),
      ),
    );
  }
}
