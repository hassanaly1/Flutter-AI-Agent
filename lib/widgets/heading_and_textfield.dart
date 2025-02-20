import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeadingAndTextField extends StatelessWidget {
  final String title;
  final double? fontSize;
  final String? hintText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? verticalPadding;

  const HeadingAndTextField({
    super.key,
    required this.title,
    this.hintText,
    this.onTap,
    this.readOnly,
    this.validator,
    this.controller,
    this.onChanged,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.fontSize,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: title,
            fontWeight: FontWeight.w500,
            maxLines: 5,
            textColor: Colors.black54,
            fontSize: fontSize ?? 12,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 4.0),
          CustomTextField(
            verticalPadding: verticalPadding,
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            readOnly: readOnly,
            hintText: hintText ?? title,
            maxLines: maxLines ?? 1,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            keyboardType: keyboardType,
            validator: validator,
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool showBackgroundShadow;
  final double? verticalPadding;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.showBackgroundShadow = true,
    this.validator,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.blackTextColor,
      ),
      keyboardType: keyboardType,
      inputFormatters: [
        if (keyboardType == TextInputType.number)
          FilteringTextInputFormatter.digitsOnly,
      ],
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.symmetric(vertical: 4.0),
        // isCollapsed: true,
        isDense: true,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.lightTextColor,
        ),
        errorStyle: const TextStyle(
          fontSize: 10.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: Colors.redAccent,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.black54)),
      ),
    );
  }
}
