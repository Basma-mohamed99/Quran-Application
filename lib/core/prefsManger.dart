import 'package:quran_application/core/resources/app_constansts.dart';
import 'package:quran_application/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManger {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
  static saveMostRecent(List<SuraModel> sura) {
    prefs.setStringList("suraRecent", sura.map((e) =>e.nameEn  ).toList());

  }
  static List<SuraModel>  getMostRecent() { {
   List<String>savedSuras= prefs.getStringList("suraRecent")??[];
   return savedSuras.map((e) => AppConstansts.suras.firstWhere((element) => element.nameEn==e)).toList();

  }

  }

  static isNavegate(bool isNavegate) {
    prefs.setBool("isNavegate", isNavegate);
  }
  static bool getIsNavegate (){
   bool isNavegate=prefs.getBool("isNavegate")??false;
     return isNavegate;
  }
}
