import 'package:flutter/material.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';

class Home extends StatefulWidget {
  static const routname = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: buildBottomNavigationBar());
  }
  
  Widget? buildBottomNavigationBar() {return BottomNavigationBar(
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.black,
    onTap: (index) {
      print("ahmed");
    },
    currentIndex: selectedIndex,
    items: [
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppAssets.icquran)),
        label: "quran",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
        label: "ahadeth",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppAssets.icSebha)),
        label: "sebha",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppAssets.icRadio)),
        label: "Radio",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(AppAssets.icAzkar)),
        label: "Azkar",
      ),
    ],
  );
}
}



  