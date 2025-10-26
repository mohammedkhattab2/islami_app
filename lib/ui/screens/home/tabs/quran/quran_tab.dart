import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/sura_datails/sura_details.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_row.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_conestance.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';
import 'package:islami_app/ui/utilits/most_recent_suras_prefrences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraDM> filterdSurasList = AppConestance.suras;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MostRecentSurasPref.loadsuraList().then((_) {
      setState(() {});
    });
  }

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
          SizedBox(height: 20),
          Text("Most Recent ", style: AppTextStyles.whiteBold16),
          if (MostRecentSurasPref.surasList.isNotEmpty)
            Expanded(flex: 3, child: buildMostRecentList()),
          Expanded(flex: 7, child: buildSuralistview()),
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
      onChanged: (query) {
        search(query);
      },
      style: AppTextStyles.whiteBold12,
      cursorColor: AppColors.gold,
    );
  }

  Widget buildSuralistview() {
    return ListView.separated(
      itemCount: filterdSurasList.length,
      itemBuilder: (context, index) {
        var sura = filterdSurasList[index];
        return InkWell(
          onTap:  () async {
            MostRecentSurasPref.addsuratopref(sura);
            await Navigator.pushNamed(context, SuraDetails.routName, arguments: sura);
            setState(() {
              
            });
          },
          child: SuraRow(sura: sura),
        );
      },
      separatorBuilder: (_, _) => Divider(endIndent: 64, indent: 64),
    );
  }

  void search(String query) {
    filterdSurasList = AppConestance.suras.where((sura) {
      return sura.namear.contains(query) ||
          sura.nameen.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {});
  }

  Widget buildMostRecentList() {
    return ListView.builder(
      itemCount: MostRecentSurasPref.surasList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var sura = MostRecentSurasPref.surasList[index];
        return Container(
          width: MediaQuery.of(context).size.width * .7,
          margin: EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Row(
            children: [
              SizedBox(width: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(sura.nameen, style: AppTextStyles.blackBold24),
                  Text(sura.namear, style: AppTextStyles.blackBold24),
                  Text(
                    "${sura.verses} verses",
                    style: AppTextStyles.blackBold14,
                  ),
                ],
              ),
              Expanded(
                child: Image.asset(AppAssets.recentQuranImage))
            ],
          ),
        );
      },
    );
  }
}
