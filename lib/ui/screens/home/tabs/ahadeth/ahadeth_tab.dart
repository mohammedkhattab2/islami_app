import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(backgroundColor: Colors.blue);
  }

  void readAhadethfile() async {
    String ahadethFile = await rootBundle.loadString(
      "assets/files/ahadeth.txt",
    );
    print(ahadethFile);
  }
}
