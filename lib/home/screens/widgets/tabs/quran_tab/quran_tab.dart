import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_application/core/resources/app_constansts.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/home/screens/widgets/tabs/quran_tab/widget/recently_item.dart';
import 'package:quran_application/home/screens/widgets/tabs/quran_tab/widget/sura_item.dart';
import 'package:quran_application/model/sura_model.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManger.Background_of_quran_tab),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManger.img_header_islamy,
                  width: width * 0.7,
                  fit: BoxFit.fitWidth,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: SvgPicture.asset(
                      IconsManger.quran_icon,
                      width: 24,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                        ApplicationColors.gold,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ApplicationColors.gold,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ApplicationColors.gold,
                      width: 1,
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFEFFE8),
                  ),
                  hintText: "Sura Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ApplicationColors.gold,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Most Recent",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFEFFE8),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: height * 0.2,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => RecentlyItem(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Sura List",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => SuraItem(

                    suraModel: SuraModel(
                      number: (index+1).toString(),
                      nameAr: AppConstansts.arabicAuranSuras[index],
                      nameEn: AppConstansts.englishQuranSurahs[index],
                      Verses: "${AppConstansts.verses[index]} verses",
                    ),
                    index: index + 1,
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: AppConstansts.arabicAuranSuras.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }



}
