import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Theme",
          fontSize: 16.0,
        ),
        centerTitle: true,
      ),
      body: SwitchListTile(
        title: CustomTextWidget(
          text: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          textAlign: TextAlign.start,
        ),
        value: isDark,
        onChanged: (value) {
          setState(() {
            isDark = value;
          });
        },
      ),
    );
  }
}
