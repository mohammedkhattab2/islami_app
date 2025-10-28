import 'package:flutter/material.dart';
import 'package:islami_app/on_bording/on_bording.dart';
import 'package:islami_app/ui/screens/hadith_details/hadith_details.dart';
import 'package:islami_app/ui/sura_datails/sura_details.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/screens/home/splash.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_conestance.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  AppConestance.fillsuras();
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final bool showOnBording = pref.getBool("OnBording") ?? true;

  runApp(MyApp(showonbording: showOnBording));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.showonbording, super.key});
  final bool showonbording;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: AppColors.gold),
      initialRoute: showonbording ? OnBordingPadge.routeName : Home.routname,
      routes: {
        Splash.routname: (_) => const Splash(),
        Home.routname: (_) => const Home(),
        SuraDetails.routName: (_) => const SuraDetails(),
        HadithDetails.routName: (_) => const HadithDetails(),
        OnBordingPadge.routeName: (_) => OnBordingPadge(),
      },
    );
  }
}
