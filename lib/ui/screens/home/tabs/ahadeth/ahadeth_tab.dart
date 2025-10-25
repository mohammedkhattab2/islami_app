import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';

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
          children: [Image.asset(AppAssets.islamiLogo)],
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
      print("${ahadeth[i].titile}");
    }
  }
}
