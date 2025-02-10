import 'package:ai_agent/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final int? maxLines;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.textAlign = TextAlign.center,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.fontStyle,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        decoration: decoration,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor ?? AppColors.blackTextColor,
      ),
    );
  }
}
