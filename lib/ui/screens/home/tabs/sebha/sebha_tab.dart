import 'package:flutter/material.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا حول ولا قوة إلا بالله",
  ];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.sebhaBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 70, right: 69),
              child: Image.asset(AppAssets.islamiLogo),
            ),
            SizedBox(height: 16),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: AppTextStyles.wihteBold36,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Image.asset(AppAssets.sebhaHead),
            Stack(
              alignment: Alignment.center,
              children: [
                InkWell(
                  onTap: onClicked,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(AppAssets.sebhaBody),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      azkar[index],
                      style: AppTextStyles.wihteBold36,
                      maxLines: 2,
                    ),
                    Text("$counter", style: AppTextStyles.wihteBold36),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onClicked() {
    counter++;
    angle += 30;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
      counter = 0;
    }
    setState(() {});
  }
}
