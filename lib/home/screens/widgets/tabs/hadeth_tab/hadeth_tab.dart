import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/home/screens/widgets/tabs/hadeth_tab/widgets/hadeeth_item.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  int selectedIndex = 0;

  // الـ controller برّه الـ build عشان ما يتعملش من جديد مع كل setState
  final PageController controller = PageController(viewportFraction: 0.7);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ApplicationColors.black,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(AssetsManger.Background_hadeth_tab),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // ارتفاع ثابت للوجو عشان ما ياخدش مساحة من الـ PageView
            SizedBox(
              height: height * 0.15,
              child: Image.asset(
                AssetsManger.islmay_logo,
                width: width * .7,
                alignment: Alignment.topCenter,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 49,
                onPageChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return HadethItem(
                    index: index,
                    selectedindex: selectedIndex,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}