import 'package:ai_agent/widgets/custom_button.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:ai_agent/widgets/heading_and_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () => _key.currentState?.openDrawer(),
          child: Icon(Icons.menu_open_rounded),
        ),
      ),
      drawer: CustomDrawerWidget(scaffoldKey: _key),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              CupertinoIcons.chat_bubble_2,
              size: 60.0,
              color: Colors.grey.shade600,
            ),
            CustomTextWidget(
              text: 'Let\'s Talk',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomTextWidget(
                text:
                    'Ask Questions to get insights based on your agent\'s description, persona, tone, and access to knowledge.',
                maxLines: 3,
              ),
            ),
            SizedBox(height: 12.0),
            CustomButton(text: 'Create Marketing Plan'),
            CustomButton(text: 'Create Social Media Context'),
            CustomButton(text: 'Email Marketing'),
            CustomButton(text: 'Compile Marketing Reports'),
            CustomButton(text: 'Develop Brand Strategy'),
            CustomButton(text: '+ Add Command'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CustomTextWidget(
                text: 'This conversation is only visible to you',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0),
                  ),
                  border: Border.all(color: Colors.black12, width: 2.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: CustomTextField(
                      hintText: 'Ask Me Anything...',
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8.0),
                          Icon(
                            CupertinoIcons.arrow_right_circle_fill,
                            color: Colors.black45,
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            CupertinoIcons.mic_fill,
                            color: Colors.black45,
                          ),
                          SizedBox(width: 8.0),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 12.0, vertical: 8.0),
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 12.0, vertical: 6.0),
                        //     decoration: BoxDecoration(
                        //       color: Theme.of(context).colorScheme.surface,
                        //       borderRadius: BorderRadius.circular(16.0),
                        //     ),
                        //     child: Row(
                        //       children: [
                        //         Icon(Icons.menu),
                        //         SizedBox(width: 8.0),
                        //         Text(
                        //           'General',
                        //           style: TextStyle(
                        //               fontSize: 16.0,
                        //               fontWeight: FontWeight.w500),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Icon(Icons.attach_file),
                        SizedBox(width: 2.0),
                        CustomTextWidget(
                            text: '3',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomDrawerWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white54,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => scaffoldKey.currentState?.closeDrawer(),
                    child: Icon(Icons.menu_open_rounded),
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.search),
                      SizedBox(width: 8.0),
                      Icon(Icons.edit_note_rounded),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomDrawerListTile(
            title: 'AsyncHandler Explanation Fix',
            subtitle: 'Monday, Jan 1st, 2025',
            onTap: () => Navigator.of(context).pop(),
          ),
          CustomDrawerListTile(
            title: 'AI Agent Discoveries',
            subtitle: 'Monday, Dec 31st, 2024',
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const CustomDrawerListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      title: CustomTextWidget(
        text: title,
        fontSize: 14.0,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
      ),
      subtitle: CustomTextWidget(
        text: subtitle,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
        textColor: Colors.grey,
      ),
    );
  }
}
