import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class SuraDetails extends StatefulWidget {
  static const routName = "SuraDetails";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDM sura;
  String suraContent = "";
  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as SuraDM;
    if (suraContent.isEmpty) {
      readSuraContent();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: AppColors.gold),
        ),
        title: Text(sura.nameen, style: AppTextStyles.goldBold20),
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
                  sura.namear,
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
          suraContent.isEmpty
              ? Center(child: CircularProgressIndicator(color: AppColors.gold))
              : Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.16),
                      child: Text(
                        suraContent,
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

  Future readSuraContent() async {
    String filename = "assets/files/quran/${sura.index}.txt";
    Future<String> contentFuture = rootBundle.loadString(filename);
    suraContent = await contentFuture;
    List<String> suralins = suraContent.trim().split("\n");
    for (int i = 0; i < suralins.length; i++) {
      suralins[i] += " [${i + 1}] ";
    }
    suraContent = suralins.join();
    setState(() {});
  }
}
