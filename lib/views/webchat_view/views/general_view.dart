import 'package:ai_agent/views/chat_view.dart';
import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_button.dart';
import 'package:ai_agent/widgets/custom_tabbar.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:ai_agent/widgets/heading_and_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Settings.',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              CustomTextWidget(
                text: 'Configurations for the webchat.',
                fontSize: 14.0,
                textColor: AppColors.lightTextColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.image_outlined)),
                  Expanded(
                    child: HeadingAndTextField(
                      title: 'Bot Name',
                      hintText: 'Your Chatbot name.',
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.0),
              HeadingAndTextField(
                title: 'Description',
                hintText: 'A brief description of your chatbot.',
              ),
              SizedBox(height: 8.0),
              HeadingAndTextField(
                title: 'Composer Placeholder',
                hintText: 'Chat with bot.',
              ),
              SizedBox(height: 8.0),
              CustomTextWidget(
                text: 'Allow user file upload',
                fontWeight: FontWeight.w500,
                maxLines: 1,
                textColor: Colors.black54,
                fontSize: 12,
              ),
              SizedBox(height: 4.0),
              DefaultTabController(
                length: 2,
                child: SizedBox(
                  height: 40.0,
                  child: CustomTabBar(
                    title1: 'Enabled',
                    title2: 'Disabled',
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              Divider(color: Colors.grey),
              SizedBox(height: 6.0),
              CustomTextWidget(
                text: 'Contact.',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              CustomTextWidget(
                text: 'Contact information for your bot.',
                fontSize: 14.0,
                textColor: AppColors.lightTextColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 12.0),
              CustomTextField(
                hintText: 'example@example.com',
                prefixIcon: Icon(CupertinoIcons.mail),
              ),
              SizedBox(height: 12.0),
              CustomTextField(
                  hintText: '+1 555 555 555',
                  prefixIcon: Icon(CupertinoIcons.phone)),
              SizedBox(height: 12.0),
              CustomTextField(
                hintText: 'https://example.com',
                prefixIcon: Icon(CupertinoIcons.globe),
              ),
              SizedBox(height: 12.0),
              HeadingAndTextField(
                title: 'Terms of Service',
                hintText: 'https://example.com/terms',
              ),
              SizedBox(height: 12.0),
              HeadingAndTextField(
                title: 'Privacy Policy',
                hintText: 'https://example.com/privacy',
              ),
              SizedBox(height: 12.0),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    text: 'Save',
                    useBackgroundColor: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
