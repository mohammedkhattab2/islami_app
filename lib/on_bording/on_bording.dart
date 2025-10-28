import 'package:flutter/material.dart';
import 'package:islami_app/model/on_bording_model.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class OnBordingPadge extends StatelessWidget {
  static const String routeName = 'onbordingPage';

   OnBordingPadge({super.key});

  List<OnBordingModel> onBordingPages = [
    OnBordingModel(imagepath: AppAssets.introscreen1, title: "Welcome To Islmi App",),
    OnBordingModel(imagepath: AppAssets.introscreen2, title: "Welcome To Islami",description: "We Are Very Excited To Have You In Our Community"),
    OnBordingModel(imagepath: AppAssets.introscreen3, title: "Reading the Quran", description: "Read, and your Lord is the Most Generous"),
    OnBordingModel(imagepath: AppAssets.introscreen4, title: "Bearish", description: "Praise the name of your Lord, the Most High"),
    OnBordingModel(imagepath: AppAssets.introscreen5, title: "Holy Quran Radio", description: "You can listen to the Holy Quran Radio through the application for free and easily")

  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(AppAssets.islamiLogo,
          height: screenSize.height *0.2,),
          Expanded(
            child: PageView.builder(
              itemCount: onBordingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      onBordingPages[index].imagepath,
                      height: screenSize.height *0.45,
                    ),
                    Text(onBordingPages[index].title,
                    style: AppTextStyles.primary24,),
                    Text(onBordingPages[index].description?? "",
                    style: AppTextStyles.primary20, textAlign: TextAlign.center,) 
                  ],
                );
              }),
          )
        ],
      ),
    );
  }
}