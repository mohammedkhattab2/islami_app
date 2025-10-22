import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class SuraRow extends StatelessWidget {
  final SuraDM sura;
  const SuraRow({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildindeximage(),
        SizedBox(width: 24),
        Expanded(child: buildEnInfo()),
        buildNameAr(),
      ],
    );
  }

  Widget buildindeximage() => Container(
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(AppAssets.suraNumberBg)),
    ),
    child: Center(
      child: Text(sura.index.toString(), style: AppTextStyles.whiteBold14),
    ),
  );

  Widget buildEnInfo() => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sura.nameen, style: AppTextStyles.whiteBold20),
        SizedBox(height: 4),
        Text("${sura.verses} Verses", style: AppTextStyles.whiteBold14),
      ],
    ),
  );

  Widget buildNameAr() => Text(sura.namear, style: AppTextStyles.whiteBold20);
}
