import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/model/model_of_onbodring.dart';
import 'package:quran_application/on_Bording_screen/widget/dot_indicator.dart';

import '../../core/resources/application_colors.dart';

class CustomOnbording extends StatelessWidget {

  int indexOfOnbording;
  bool isActive;
  int currentIndex;
  Function ()onBackTap;
  Function ()onNextTap;
  final ModelOfOnbodring modelOfOnbodring;
   CustomOnbording({super.key, required this.modelOfOnbodring,required this.indexOfOnbording
   ,required this.isActive,
   required this.currentIndex,
     required this.onBackTap,
     required this.onNextTap
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(modelOfOnbodring.pathIamge),
          SizedBox(height: 20,),

          Text(textAlign: TextAlign.center,
              modelOfOnbodring.title??" ",style: TextStyle(
          color: ApplicationColors.gold,
      fontSize: 24,
      fontWeight: FontWeight.w700
      )),
          SizedBox(height: 20,),
          Expanded(
            child: Text(textAlign: TextAlign.center,
              modelOfOnbodring.body,style: TextStyle(

              color: ApplicationColors.gold,
               fontSize: 24,
              fontWeight: FontWeight.w700
            ),),
          ),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           currentIndex==0? Container():
           GestureDetector(
             onTap: onBackTap,
             child: Text("Back",style: TextStyle(

                    color: ApplicationColors.gold,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                )),
           ),
              Row(children:List.generate(indexOfOnbording, (index) => DotIndicator(isActive:currentIndex==index?isActive=true:false,),
              ) ,
              ),
              GestureDetector(
                onTap: onNextTap,
                child: Text(currentIndex==ModelOfOnbodring.modelOfOnbodrings.length-1?"Done":"Next",style: TextStyle(
                
                    color: ApplicationColors.gold,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
