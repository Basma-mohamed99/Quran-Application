import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/model/sura_model.dart';

import '../../../../../../core/resources/assets_manger.dart';

class RecentlyItem extends StatelessWidget {
  final SuraModel suraModel;
  const RecentlyItem({super.key,required this.suraModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: ApplicationColors.gold,
      ),


      
      child:  Row(
        children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text(suraModel.nameEn,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
         Text(suraModel.nameAr,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
   Text("${suraModel.verses} verses",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),


      ],
    ),
    Image.asset(AssetsManger.img_most_recent,)
    ],
    ),
    );
  }
}
