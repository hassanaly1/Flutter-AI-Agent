import 'package:ai_agent/widgets/custom_text.dart';
import 'package:ai_agent/widgets/heading_and_textfield.dart';
import 'package:flutter/material.dart';

class ShareView extends StatelessWidget {
  const ShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: 'Shareable Link.',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8.0),
              const HeadingAndTextField(
                title:
                    'Share the following link with people that would like to quickly test your chatbot.',
                hintText:
                    'https://cdn.botpress.cloud/webchat/v2.3/shareable.html?configUrl=https://files.bpcontent.cloud/2025/02/04/06/20250204064517-1YAJ432X.json',
              ),
              const SizedBox(height: 12.0),
              const CustomTextWidget(
                text: 'Embed code',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8.0),
              HeadingAndTextField(
                title: 'Copy and paste this code on your webpage.',
                hintText:
                    '<script src="https://cdn.botpress.cloud/webchat/v2.2/inject.js"></script> <script src="https://files.bpcontent.cloud/2025/02/04/06/20250204064517-JCV0PKUU.js"></script>',
                maxLines: 4,
                readOnly: true,
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.copy_all)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
