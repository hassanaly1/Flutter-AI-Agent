import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = _localization.currentLocale?.languageCode;
  }

  void _changeLanguage(String? newLang) {
    if (newLang != null) {
      setState(() {
        _selectedLanguage = newLang;
      });
      _localization.translate(newLang);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Languages",
          fontSize: 16.0,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: 'Select Language',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text("English"),
                  value: 'en',
                  groupValue: _selectedLanguage,
                  onChanged: _changeLanguage,
                ),
                RadioListTile<String>(
                  title: const Text("Español"),
                  value: 'es',
                  groupValue: _selectedLanguage,
                  onChanged: _changeLanguage,
                ),
                RadioListTile<String>(
                  title: const Text("हिन्दी"),
                  value: 'hi',
                  groupValue: _selectedLanguage,
                  onChanged: _changeLanguage,
                ),
                RadioListTile<String>(
                  title: const Text("Deutsch"),
                  value: 'de',
                  groupValue: _selectedLanguage,
                  onChanged: _changeLanguage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
