import 'package:ai_agent/views/settings/language.dart';
import 'package:ai_agent/views/settings/theme.dart';
import 'package:ai_agent/views/settings/timezones.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSettingTile(
              title: 'Theme',
              icon: Icons.timelapse_outlined,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemeScreen()));
              },
            ),
            CustomSettingTile(
              title: 'Timezone',
              icon: Icons.timelapse_outlined,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TimeZoneScreen()));
              },
            ),
            CustomSettingTile(
              title: 'Language',
              icon: Icons.language,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanguageScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  const CustomSettingTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
        size: 20.0,
      ),
      minLeadingWidth: 10.0,
      title: CustomTextWidget(
        text: title,
        fontSize: 14.0,
        textColor: Colors.black87,
        textAlign: TextAlign.start,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.grey,
        size: 15.0,
      ),
    );
  }
}
