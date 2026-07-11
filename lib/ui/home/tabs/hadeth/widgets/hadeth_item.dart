import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c19/core/resources/assets_manager.dart';
import 'package:islami_c19/core/resources/colors_manager.dart';
import 'package:islami_c19/core/resources/routes_manager.dart';
import 'package:islami_c19/model/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  bool isSelected;
  int hadethNumber;
  HadethItem({required this.isSelected,required this.hadethNumber});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  @override
  Widget build(BuildContext context) {
    if(myHadeth==null){
      readFile();
    }
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RoutesManager.hadethDetailsRouteName,arguments:myHadeth );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 8,
          right: 8,
          top: widget.isSelected?0:15
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorsManager.goldColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 12
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManager.hadethLeftCorner),
                      Image.asset(AssetsManager.hadethRightCorner),
                    ],
                  ),
                  Text(myHadeth?.title??"",style: TextStyle(
                    color: ColorsManager.blackColor,
                    fontWeight:FontWeight.w700,
                    fontSize: 24
                  ),)
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Image.asset(AssetsManager.hadethCardBack,fit: BoxFit.fill)),
                      Expanded(child: Image.asset(AssetsManager.hadethMosque,width: double.infinity,fit: BoxFit.fill,)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(myHadeth?.content??"",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.blackColor
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  HadethModel? myHadeth;

  readFile()async{
    String allHadeth = await rootBundle.loadString("assets/Hadeeth/h${widget.hadethNumber}.txt");
    List<String> hadethLines =  allHadeth.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    String content = hadethLines.join(" ");
    setState(() {
      myHadeth = HadethModel(title: title, content: content, number: widget.hadethNumber);
    });
  }
}
