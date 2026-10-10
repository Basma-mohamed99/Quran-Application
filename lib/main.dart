import 'package:flutter/material.dart';
import 'package:quran_application/core/resources/route_manger.dart';
import 'package:quran_application/home/screens/home_screen.dart';
import 'package:quran_application/quran_detalis/quran_detalis.dart';
void main() {
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
      } ,
      initialRoute:RouteManger.homeRoute ,
    );
  }
}
