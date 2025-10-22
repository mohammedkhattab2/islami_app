import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_conestance.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.quranBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Image.asset(AppAssets.islamiLogo),
          buildSearchTextFild(),
          Expanded(child: buildSuralistview()),
        ],
      ),
    );
  }

  buildSearchTextFild() {
    var defultborder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      decoration: InputDecoration(
        border: defultborder,
        focusedBorder: defultborder,
        enabledBorder: defultborder,
        labelText: "Sura name ",
        labelStyle: AppTextStyles.whiteBold12,
        prefixIcon: ImageIcon(
          AssetImage(AppAssets.icquran),
          color: AppColors.gold,
        ),
      ),
      style: AppTextStyles.whiteBold12,
      cursorColor: AppColors.gold,
    );
  }

  Widget buildSuralistview() {
    return ListView.separated(
      itemCount: AppConestance.suras.length,
      itemBuilder: (context, index) {
        return SuraRow(sura: AppConestance.suras[index]);
      },
      separatorBuilder: (_, _) => Divider(endIndent: 64, indent: 64),
    );
  }
}
