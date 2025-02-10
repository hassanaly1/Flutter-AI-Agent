import 'package:ai_agent/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String? title1;
  final String? title2;
  final void Function(int)? onTap;

  const CustomTabBar({super.key, this.title1, this.title2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: AppColors.lightTextColor)),
      child: TabBar(
        onTap: onTap,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.primaryColor,
        ),
        labelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.lightTextColor,
        unselectedLabelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
        indicatorSize: TabBarIndicatorSize.tab,
        // isScrollable: true,
        // tabAlignment: TabAlignment.center,
        tabs: [
          Tab(text: title1),
          Tab(text: title2),
        ],
      ),
    );
  }
}
