import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/home.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';

class Splash extends StatefulWidget {
  static const routname = 'splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
  
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routname);
    });

  }
  @override
  Widget build(BuildContext context) {
    
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
