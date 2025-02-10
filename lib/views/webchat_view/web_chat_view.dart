import 'package:ai_agent/views/webchat_view/views/advance_settings.dart';
import 'package:ai_agent/views/webchat_view/views/general_view.dart';
import 'package:ai_agent/views/webchat_view/views/share_view.dart';
import 'package:ai_agent/views/webchat_view/views/theme_view.dart';
import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class WebChatView extends StatelessWidget {
  const WebChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              dividerColor: Colors.grey.shade200,
              tabAlignment: TabAlignment.center,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor:
                  Theme.of(context).primaryColor.withValues(alpha: 0.6),
              labelStyle: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
              unselectedLabelColor: Colors.grey.shade600,
              tabs: [
                Tab(text: 'General'),
                Tab(text: 'Theme'),
                Tab(text: 'Share'),
                Tab(text: 'Advance Settings'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GeneralView(),
                  ThemeView(),
                  ShareView(),
                  AdvanceSettingsView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
