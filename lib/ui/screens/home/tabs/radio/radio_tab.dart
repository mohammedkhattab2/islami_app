import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_item.dart';
import 'package:islami_app/ui/utilits/app_assets.dart';
import 'package:islami_app/ui/utilits/app_colors.dart';
import 'package:islami_app/ui/utilits/app_text%20_styles.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.radioBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(AppAssets.islamiLogo, width: double.infinity),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(31, 32, 32, 70),
                ),

                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primary,
                  ),
                  unselectedLabelStyle: AppTextStyles.whiteBold16,
                  labelStyle: AppTextStyles.blackBold16,
                  tabs: [
                    Tab(child: Text("radio")),
                    Tab(child: Text("Reciters")),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return RadioItem();
                      },
                    ),
                    ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return RadioItem();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
