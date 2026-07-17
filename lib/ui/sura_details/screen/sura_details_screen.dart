import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/model/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(suraVerses.isEmpty){
      readSuraFile(sura.suraNumber);
    }// async = future -> non blocking
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManager.goldColor),
        title: Text(
          sura.suraNameEn,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.leftCorner),
                      Text(
                        sura.suraNameAr,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.goldColor,
                        ),
                      ),
                      Image.asset(AssetsManager.rightCorner),
                    ],
                  ),
                  Expanded(
                    child: suraVerses.isNotEmpty
                           ?SingleChildScrollView(
                      child: Text(
                        suraVerses,
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
                           :Center(child: CircularProgressIndicator(color: ColorsManager.goldColor,)),
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

  int add(int num1 , int num2){
    return num1 + num2;
  }

  String suraVerses = "";

  readSuraFile(int suraNumber) async {
    // blocking code vs non blocking code
    String suraText = await rootBundle.loadString("assets/Suras/$suraNumber.txt");
    List<String> suraLines = suraText.split("\n");
    for(int i=0;i<suraLines.length;i++){
      suraVerses  = suraVerses + suraLines[i].trim();
      suraVerses = suraVerses + "(${i+1})";
    }
    setState(() {

    });
  }
}
