import 'package:islami_app/model/sura_model.dart';
import 'package:islami_app/ui/utilits/app_conestance.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract final class MostRecentSurasPref {
  static const suraKey = "suraKey";
  static List<SuraDM> surasList = [];

  static Future loadsuraList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> curentSurasList = pref.getStringList(suraKey) ?? [];
    surasList = curentSurasList
        .map((String) => AppConestance.suras[int.parse(String) - 1])
        .toList();
  }

  static Future addsuratopref(SuraDM sura) async {
    final SharedPreferences Pref = await SharedPreferences.getInstance();
    List<String> oldSuras = Pref.getStringList(suraKey) ?? [];
    oldSuras.add(sura.index.toString());
    Pref.setStringList(suraKey, oldSuras);
    await loadsuraList();
  }
}
