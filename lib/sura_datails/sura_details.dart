import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/sura_model.dart';
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
        leading: Icon(Icons.arrow_back, color: AppColors.gold),
        title: Text(sura.nameen, style: AppTextStyles.goldBold20),
      ),
      body: Column(
        children: [
          Text(
                sura.namear,
                textAlign: TextAlign.center,
                style: AppTextStyles.goldBold24,
              ),
          suraContent.isEmpty
              ? Center(child: CircularProgressIndicator(color: AppColors.gold))
              : Text(suraContent),
        ],
      ),
    );
  }

  Future readSuraContent() async {
    String filename ="assets/files/quran/${sura.index}.txt";
    Future<String> contentFuture = rootBundle.loadString(filename);
    suraContent = await contentFuture;
    setState(() {});

  }
}
