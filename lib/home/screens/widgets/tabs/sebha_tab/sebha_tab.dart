import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/assets_manger.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
 int counter=0;

 List<String> azkar = [
   "سبحان الله",
   "الحمد لله",
   "لا إله إلا الله",
   "الله أكبر",
   "أستغفر الله",
   "أستغفر الله العظيم وأتوب إليه",
   "سبحان الله وبحمده",
   "سبحان الله العظيم",
   "لا حول ولا قوة إلا بالله",
   "اللهم صل وسلم على نبينا محمد",
   "لا إله إلا أنت سبحانك إني كنت من الظالمين",
   "حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم",
   "اللهم اغفر لي وارحمني واهدني وعافني وارزقني",
   "رب اغفر لي وتب علي إنك أنت التواب الرحيم",
   "اللهم إنك عفو تحب العفو فاعف عني",

 ];
 int index=0;
 double angle=20;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(width: double.infinity,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AssetsManger.BackgroundOfSebha)
      ,fit: BoxFit.cover
      )),
      child: Column(
        children: [
          Image.asset(AssetsManger.islmay_logo,width: width*.7,),
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Stack(alignment: Alignment.center ,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(top: -height*.081,
                          child: Image.asset(AssetsManger.headOfSeb7a)),

                      Transform.rotate(
                          angle: angle,
                          child: Image.asset(AssetsManger.SebhaBody)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(textAlign: TextAlign.center,
                      azkar[index],style: TextStyle(color: Colors.white,
                    fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),
                    Text(textAlign: TextAlign.center,
                      counter.toString(),style: TextStyle(color: Colors.white,
                    fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),
                  ],
                )
              ],
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
  void onTap (){
   setState(() {
     if(counter==33){
       counter=0;
       if(index<azkar.length-1){
         index++;
       }
       else{
         index=0;
       }


     }

     counter++;
     angle+=12;


   });


  }
}
