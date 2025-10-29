import 'package:flutter/material.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primary,
        image: DecorationImage(image: AssetImage(AppAssets.radioTabBackground),),
      ),
      child: Column(
        children: [
          Text("Radio Ibrahim Al-Akdar", style: AppTextStyles.blackBold16,),
          IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_rounded , size: 20 , color: Colors.black,))
        ],
      ) 
      
      
    );
  }
}
