import 'package:flutter/material.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class HadithDetails extends StatefulWidget {
  static const routName = "hadethDetails";
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<HadithDetails> {
  late Hadeth hadeth;
  @override
  Widget build(BuildContext context) {
    hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Image.asset(AppAssets.suraLeftCorner),
              ),
              Expanded(
                child: Text(
                  hadeth.titile,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.goldBold24,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Image.asset(AppAssets.suraRightCorner),
              ),
            ],
          ),
               Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.16),
                      child: Text(
                        hadeth.content,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.goldBold24,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
          Image.asset(AppAssets.mosqueImage),
        ],
      ),
    );
  }
}
