import 'package:ai_agent/widgets/custom_button.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:ai_agent/widgets/heading_and_textfield.dart';
import 'package:flutter/material.dart';

class AdvanceSettingsView extends StatelessWidget {
  const AdvanceSettingsView({super.key});

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
                text: 'Client Id.',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8.0),
              HeadingAndTextField(
                title:
                    'Client id is used to identify the client in the webchat. Only use this if you want to use the client without the webchat interface.',
                hintText: '04bc875c-5f1c-445d-bbd4-3a50707fffcd',
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.copy_all),
                ),
              ),
              const SizedBox(height: 12.0),
              const CustomTextWidget(
                text: 'Allowed Origins',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8.0),
              const CustomTextWidget(
                text:
                    'List of origins that are allowed to access the webchat. Leave an empty list to allow all origins.',
                fontWeight: FontWeight.w500,
                maxLines: 5,
                textAlign: TextAlign.start,
                textColor: Colors.black54,
                fontSize: 12,
              ),
              const SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text:
                            'This feature is only available for Team and Enterprise plan.',
                        maxLines: 3,
                        textColor: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 12.0),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: CustomButton(
                            text: 'Upgrade Now',
                            useBackgroundColor: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
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
