import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/screens/home/splash.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_conestance.dart';

void main() {
  AppConestance.fillsuras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: AppColors.gold),
      initialRoute: Splash.routname,
      routes: {
        Splash.routname: (_) => const Splash(),
        Home.routname: (_) => const Home(),
      },
    );
  }
}
