import 'package:flutter/material.dart';
import 'package:quran_application/core/prefsManger.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/core/resources/route_manger.dart';
import 'package:quran_application/on_Bording_screen/widget/dot_indicator.dart';

import '../model/model_of_onbodring.dart';
import 'widget/custom_onbording.dart';

class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  PageController controller = PageController();
  bool isActive=false;
  int current =0;
  int indexOfDots =0;
  bool isNavigate=false;
  @override
  @override
  void initState() {
    super.initState();

    isNavigate = PrefsManger.getIsNavegate();

    if (isNavigate) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          RouteManger.homeRoute,
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: ApplicationColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Row(),
            Image.asset(AssetsManger.islmay_logo, width: width * .7),
            Expanded(
              child: PageView.builder(
                controller:controller ,
                onPageChanged: (value) {
                  current=value;
                  setState(() {

                  });

                },
                  itemCount: 5,
                  itemBuilder:
                      (context, index) =>
                      CustomOnbording( isActive: isActive,
                        onNextTap: () {
                          if (ModelOfOnbodring.modelOfOnbodrings.length-1==current){
                            Navigator.pushReplacementNamed(context, RouteManger.homeRoute);
                             isNavigate=true;
                            PrefsManger.isNavegate(isNavigate);
                          }
                        else {
                          controller.nextPage(duration: Duration(milliseconds: 300,),curve:
                              Curves.linear);
                        }

                        },
                        onBackTap: () {
                          controller.previousPage(duration: Duration(milliseconds: 300),
                              curve: Curves.linear);

                        },
                        currentIndex: current,
                        indexOfOnbording: ModelOfOnbodring.modelOfOnbodrings.length,
                        modelOfOnbodring:ModelOfOnbodring.modelOfOnbodrings[index],
                      )),
            ),

          ],
        ),
      ),
    );
  }
}

