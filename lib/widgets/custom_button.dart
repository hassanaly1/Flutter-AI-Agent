import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool useBackgroundColor;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    required this.text,
    this.useBackgroundColor = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        decoration: BoxDecoration(
            color: useBackgroundColor
                ? Theme.of(context).colorScheme.primary
                : null,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade400, width: 1.0)),
        child: Center(
          child: CustomTextWidget(
            text: text,
            textColor: useBackgroundColor
                ? AppColors.whiteTextColor
                : AppColors.lightTextColor,
            fontSize: useBackgroundColor ? 16.0 : 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
