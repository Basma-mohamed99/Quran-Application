import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/model/sura_model.dart';

import '../../../../../../core/resources/route_manger.dart';

  class   SuraItem extends StatelessWidget {
  final SuraModel suraModel;
  final int index;
   SuraItem({required this.suraModel ,required this.index ,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:() {
      Navigator.pushNamed( arguments: suraModel,context, RouteManger.quran_detalis);
    } ,
      child: Row(
        children: [
          Stack(alignment: Alignment.center,
            children: [
             SvgPicture.asset(IconsManger.img_sur_number_frame),
              Text(index.toString(),style: TextStyle(fontSize:20 ,
              fontWeight: FontWeight.w700,
                color: Colors.white
              ),)

            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              Text(suraModel.nameEn,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
              Text(suraModel.Verses,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),),
            ],),
          ),

          Text(suraModel.nameAr,style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 24
      ),)
        ],
      ),

    );
  }
}
