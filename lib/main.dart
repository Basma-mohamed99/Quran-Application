import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/route_manger.dart';
import 'package:quran_application/home/screens/home_screen.dart';
import 'package:quran_application/quran_detalis/quran_detalis.dart';

import 'core/prefsManger.dart';
import 'on_Bording_screen/on_Bording_screen.dart';
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await PrefsManger.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(

      ),
      routes:{
        RouteManger.homeRoute:(context)=>HomeScreen(),
        RouteManger.quran_detalis:(context)=>QuranDetalis(),
        RouteManger.OnBording:(context)=>OnBordingScreen(),
      } ,

    );
  }
}
