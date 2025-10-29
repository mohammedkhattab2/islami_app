import 'package:flutter/material.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primary,
        image: DecorationImage(
          image: AssetImage(AppAssets.radioTabBackground),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          Text("Radio Ibrahim Al-Akdar", style: AppTextStyles.blackBold16),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 35,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.stop_rounded, size: 35, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_down_rounded,
                  size: 35,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
