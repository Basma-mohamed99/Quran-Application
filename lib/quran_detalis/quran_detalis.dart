import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/model/sura_model.dart';

class QuranDetalis extends StatefulWidget {
  @override
  State<QuranDetalis> createState() => _QuranDetalisState();

  QuranDetalis({super.key});
}

class _QuranDetalisState extends State<QuranDetalis> {
  late SuraModel  suraModel ;


  @override
  Widget build(BuildContext context) {
      suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
      if(suraText.isEmpty){
        loadFile();
      }

      return Scaffold(
      backgroundColor: ApplicationColors.black2020,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(suraModel.nameEn),
        foregroundColor: ApplicationColors.gold,
        backgroundColor: ApplicationColors.black2020,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetsManger.img_left_corner),
                      suraText.isEmpty?CircularProgressIndicator():Text(
                        suraModel.nameAr,
                        style: TextStyle(
                          color: ApplicationColors.gold,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Image.asset(AssetsManger.img_right_corner),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center, suraText,
                     style: TextStyle(

                          height: 2.5,
                          color: ApplicationColors.gold,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Image.asset(AssetsManger.img_bottom_decoration),
        ],
      ),
    );
  }

   String suraText = "";

   loadFile() async {
     String suradata = await rootBundle.loadString(
       "assets/files/Suras/${suraModel.number}.txt",
     );

     List<String> lines = suradata.split("\n");

     for (int i = 0; i < lines.length; i++) {
       suraText += "${lines[i].trim()} (${i + 1}) ";
     }
     setState(() {

     });

   }
}
