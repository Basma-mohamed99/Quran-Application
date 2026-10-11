import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/application_colors.dart';

import '../../../../../../core/resources/assets_manger.dart';

class RecentlyItem extends StatelessWidget {
  const RecentlyItem({super.key});

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
      Text("Al-Anbiya",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
         Text("الأنبياء",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
   Text("112 Verses  ",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),


      ],
    ),
    Image.asset(AssetsManger.img_most_recent,)
    ],
    ),
    );
  }
}
