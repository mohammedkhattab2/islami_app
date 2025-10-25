import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class Hadeth {
  String titile;
  String content;
  Hadeth(this.titile, this.content);
}

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadeth = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAhadethfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.ahadethBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.islamiLogo),
            if (ahadeth.isNotEmpty)
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: ahadeth.length,
                  options: CarouselOptions(
                    // height: 400,
                    // aspectRatio: 16 / 9,
                    // viewportFraction: 0.8,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    // enlargeFactor: 0.3,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                    height: double.infinity,
                    enlargeFactor: .1,
                  ),
                  itemBuilder:
                      (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppAssets.hadethBackground),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 42.66,
                                right: 80.09,
                                left: 83.09,
                              ),
                              child: Text(
                                ahadeth[itemIndex].titile,
                                style: AppTextStyles.blackBold24,
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 22.62,
                                  right: 24.43,
                                  top: 101,
                                  bottom: 24.79,
                                ),

                                child: Text(
                                  ahadeth[itemIndex].content,
                                  style: AppTextStyles.blackBold16,
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void readAhadethfile() async {
    String ahadethFile = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );
    List<String> ahadethList = ahadethFile.split("#\r\n");
    for (int i = 0; i < ahadethList.length; i++) {
      String hadeth = ahadethList[i];
      List<String> hadethlines = hadeth.split("\n");
      String title = hadethlines.removeAt(0);
      ahadeth.add(Hadeth(title, hadethlines.join()));
      setState(() {});
    }
  }
}
