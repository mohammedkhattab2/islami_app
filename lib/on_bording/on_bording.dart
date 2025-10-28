import 'package:flutter/material.dart';
import 'package:islami_app/model/on_bording_model.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';
import 'package:islami_app/widget/dot_indecator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBordingPadge extends StatefulWidget {
  static const String routeName = 'onbordingPage';

  OnBordingPadge({super.key});

  @override
  State<OnBordingPadge> createState() => _OnBordingPadgeState();
}

class _OnBordingPadgeState extends State<OnBordingPadge> {
  List<OnBordingModel> onBordingPages = [
    OnBordingModel(
      imagepath: AppAssets.introscreen1,
      title: "Welcome To Islmi App",
    ),
    OnBordingModel(
      imagepath: AppAssets.introscreen2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnBordingModel(
      imagepath: AppAssets.introscreen3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnBordingModel(
      imagepath: AppAssets.introscreen4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnBordingModel(
      imagepath: AppAssets.introscreen5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.toInt() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.islamiLogo, height: screenSize.height * 0.2),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onBordingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onBordingPages[index].imagepath,
                        height: screenSize.height * 0.45,
                      ),
                      SizedBox(height: 41),
                      Text(
                        onBordingPages[index].title,
                        style: AppTextStyles.primary24,
                      ),
                      SizedBox(height: 42.10),
                      Text(
                        onBordingPages[index].description ?? "",
                        style: AppTextStyles.primary20,
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: currentIndex != 0
                                    ? () {
                                        if (currentIndex != 0) {
                                          pageController.animateToPage(
                                            currentIndex - 1,
                                            duration: Duration(
                                              milliseconds: 300,
                                            ),
                                            curve: Curves.bounceIn,
                                          );
                                        }
                                      }
                                    : null,
                                child: Text(
                                  currentIndex != 0 ? "back" : "",
                                  style: AppTextStyles.primary16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (currentIndex == 4) {
                                    saveOnBordingState();
                                    Navigator.pushReplacementNamed(
                                      context,
                                      Home.routname,
                                    );
                                  } else {
                                    pageController.animateToPage(
                                      currentIndex + 1,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.bounceIn,
                                    );
                                  }
                                },
                                child: Text(
                                  currentIndex != 4 ? "Next" : "Finish",
                                  style: AppTextStyles.primary16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DotIndecator(active: currentIndex == 0),
                              DotIndecator(active: currentIndex == 1),
                              DotIndecator(active: currentIndex == 2),
                              DotIndecator(active: currentIndex == 3),
                              DotIndecator(active: currentIndex == 4),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveOnBordingState() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("OnBording", false);
  }
}
