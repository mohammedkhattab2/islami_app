import 'package:flutter/material.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';

class DotIndecator extends StatelessWidget {
  final bool active;
  const DotIndecator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
      height: 10,
      width: active ? 20 : 10,
      decoration: BoxDecoration(
        color: active ? AppColors.gold : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
