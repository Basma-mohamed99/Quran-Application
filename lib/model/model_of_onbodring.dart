import '../core/resources/assets_manger.dart';

class ModelOfOnbodring {
 final  String? title;
  final String pathIamge;
  final String body;

   ModelOfOnbodring({this.title, required this.pathIamge, required this.body});
static List<ModelOfOnbodring> modelOfOnbodrings = [
  ModelOfOnbodring(pathIamge: AssetsManger.Frame1,
      body: "Welcome To Islmi App"),
  ModelOfOnbodring(pathIamge: AssetsManger.Frame2,
   body: "Welcome To Islmi App",
   title: "We Are Very Excited To Have You In Our Community",

  ),
  ModelOfOnbodring(pathIamge: AssetsManger.Frame3,
   body: "Reading the Quran",
   title: "Read, and your Lord is the Most Generous",

  ),
  ModelOfOnbodring(pathIamge: AssetsManger.Frame4,
   body: "Bearish",
   title: "Praise the name of your Lord, the Most High",

  ),
  ModelOfOnbodring(pathIamge: AssetsManger.Frame5,
   body: "Holy Quran Radio",
   title: "You can listen to the Holy Quran Radio through the application for free and easily",

  ),

 ];

}