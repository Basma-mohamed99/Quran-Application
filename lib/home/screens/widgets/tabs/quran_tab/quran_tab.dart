import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_application/core/prefsManger.dart';
import 'package:quran_application/core/resources/app_constansts.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/home/screens/widgets/tabs/quran_tab/widget/recently_item.dart';
import 'package:quran_application/home/screens/widgets/tabs/quran_tab/widget/sura_item.dart';
import 'package:quran_application/model/sura_model.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = "";

  List<SuraModel> filltredSearch = AppConstansts.suras;
  List<SuraModel>recentlyClicked=[];
  @override
  void initState() {
    super.initState();
    recentlyClicked=PrefsManger.getMostRecent()    ;
  }

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
                onChanged: (value) {
                  searchText = value;
                  search();
                  setState(() {});
                },
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

              Visibility(
                visible: searchText.isEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    recentlyClicked.isEmpty? Container():  Text(
                      "Most Recent",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFEFFE8),
                      ),
                    ),
                    SizedBox(height: 10),
                    recentlyClicked.isEmpty? Container():  SizedBox(
                      height: height * 0.2,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => RecentlyItem(
                          suraModel: recentlyClicked[index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount:recentlyClicked.length<5? recentlyClicked.length:
                        recentlyClicked.length=5,
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
                  ],
                ),
              ),
            Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => SuraItem(
                    recently: (value) {
                      if(recentlyClicked.contains(filltredSearch[index])){
                        recentlyClicked.remove(filltredSearch[index]);
                      }

                      recentlyClicked.insert(0,filltredSearch[index]);
                      PrefsManger.saveMostRecent(recentlyClicked);





                      setState(() {});
                    },

                    suraModel: SuraModel(
                      number:(index + 1).toString(),
                      nameAr:filltredSearch[index].nameAr,
                      nameEn:filltredSearch[index].nameEn,
                      verses:"${filltredSearch[index].verses} verses",
                    ),
                    index: index + 1,
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: filltredSearch.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  search() {
    if (searchText.isEmpty) {
      filltredSearch = AppConstansts.suras;
    } else {
      filltredSearch = AppConstansts.suras;
      filltredSearch = filltredSearch.where((element) {
        if (element.nameAr.contains(searchText)) {
          return true;
        }
        if (element.nameEn.toLowerCase().contains(searchText)) {
          return true;
        }
        if (element.nameEn.toUpperCase().contains(searchText)) {
          return true;
        }
        return false;
      }).toList();
    }
  }
}
