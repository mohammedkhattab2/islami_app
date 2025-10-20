import 'package:flutter/material.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';

class Splash extends StatelessWidget {
  static const routname = 'splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(AppAssets.splash));
  }
}
