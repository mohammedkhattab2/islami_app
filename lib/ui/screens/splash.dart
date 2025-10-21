import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';

class Splash extends StatelessWidget {
  static const routname = 'splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routname);
    });
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Image.asset(
        AppAssets.splash,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
