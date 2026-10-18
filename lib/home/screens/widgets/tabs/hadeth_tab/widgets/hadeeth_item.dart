import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';

import '../../../../../../model/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  final int selectedindex;
  final int index;

  const HadethItem({
    super.key,
    required this.index,
    required this.selectedindex,
  });

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  late HadethModel hadethModel;

  @override
  void initState() {
    super.initState();
    hadethModel = HadethModel();
    // لازم widget.index (رقم الكارت نفسه) مش selectedindex
    loadHadeth(widget.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.selectedindex == widget.index;

    return InkWell(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: isSelected ? 20 : 40,
        ),
        decoration: BoxDecoration(
          color: ApplicationColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              // صف الزوايا + رقم الحديث بارتفاع ثابت
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SizedBox(
                  height: 28,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          AssetsManger.img_left_corner,
                          color: ApplicationColors.black,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            hadethModel.numberOfHadet ?? " ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          AssetsManger.img_right_corner,
                          color: ApplicationColors.black,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        AssetsManger.HadithCardBackGround,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        AssetsManger.img_bottom_decoration,
                        color: ApplicationColors.black,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned.fill(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Text(
                          hadethModel.hadeethText ?? " ",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 20,
                            wordSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadHadeth(int index) async {
    final String datahadeeth =
    await rootBundle.loadString('assets/files/Hadeeth/h$index.txt');
    hadethModel.numberOfHadet = datahadeeth.split('\n')[0];
    hadethModel.hadeethText =
        datahadeeth.substring(datahadeeth.indexOf('\n') + 1);
    if (!mounted) return;
    setState(() {});
  }
}