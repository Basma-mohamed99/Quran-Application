import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/application_colors.dart';
import 'package:quran_application/core/resources/assets_manger.dart';
import 'package:quran_application/home/screens/widgets/navigation_tabs.dart';
import 'package:quran_application/home/screens/widgets/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:quran_application/home/screens/widgets/tabs/quran_tab/quran_tab.dart';
import 'package:quran_application/home/screens/widgets/tabs/radio_tab/radio_tab.dart';
import 'package:quran_application/home/screens/widgets/tabs/sebha_tab/sebha_tab.dart';
import 'package:quran_application/home/screens/widgets/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>tabs= [
  QuranTab(),
  HadethTab(),SebhaTab(),RadioTab(),TimeTab(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar
        (
        labelTextStyle: WidgetStateProperty.all(TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.white
        )),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        maintainBottomViewPadding: true,
        backgroundColor: ApplicationColors.gold,
        selectedIndex: index,
        indicatorColor: ApplicationColors.grey,

        onDestinationSelected: (value) {
          index = value;
          setState(() {

          });
        },
        destinations: [
          NavigationTabs(label: "Quran", icon: IconsManger.quran_icon,),
          NavigationTabs(label: "Hadeth", icon: IconsManger.hadeth_icon),
          NavigationTabs(label: "Sebha", icon: IconsManger.sebha),
          NavigationTabs(label: "Radio", icon: IconsManger.radio_icon),
          NavigationTabs(label: "Time", icon: IconsManger.time),

        ],
      ),
      body:tabs[index],
    );
  }
}
