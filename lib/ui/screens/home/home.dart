import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/azkar/azkar_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class Home extends StatefulWidget {
  static const routname = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    AzkarTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget? buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      iconSize: 30,
      selectedLabelStyle: AppTextStyles.whiteBold12,
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icquran,
            selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icAhadeth,
            selectedIndex == 1,
          ),
          label: "Ahadeth",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icSebha,
            selectedIndex == 2,
          ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icRadio,
            selectedIndex == 3,
          ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          icon: buildBottomNavigationBarIcon(
            AppAssets.icAzkar,
            selectedIndex == 4,
          ),
          label: "Azkar",
        ),
      ],
    );
  }

  buildBottomNavigationBarIcon(String icon, bool isselcted) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      margin: EdgeInsets.only(top: 14, left: 21),
      decoration: BoxDecoration(
        color: isselcted ? AppColors.blackWithOpacity60 : Colors.transparent,
        borderRadius: BorderRadius.circular(66),
      ),

      child: ImageIcon(AssetImage(icon)),
    );
  }
}
