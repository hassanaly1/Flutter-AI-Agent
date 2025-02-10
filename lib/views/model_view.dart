import 'dart:developer';

import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AiModel {
  final String name;
  final String purpose;
  final String price;
  final bool isRecommended;

  AiModel(this.name, this.purpose, this.price, this.isRecommended);
}

class ModelView extends StatefulWidget {
  const ModelView({
    super.key,
  });

  @override
  State<ModelView> createState() => _ModelViewState();
}

class _ModelViewState extends State<ModelView> {
  List<AiModel> aiModelsList = [
    // OpenAI Models
    AiModel("GPT-4o Mini", "general-purpose", "\$50 for 1M tokens", false),
    AiModel("GPT-4o (November 2024)", "vision", "\$100 for 1M tokens", true),
    AiModel("GPT-4o (August 2024)", "vision", "\$100 for 1M tokens", true),
    AiModel("GPT-4o (May 2024)", "vision", "\$100 for 1M tokens", false),
    AiModel("GPT-4 Turbo (Deprecated)", "general-purpose", "\$80 for 1M tokens",
        false),
    AiModel("GPT-3.5 Turbo (Deprecated)", "general-purpose",
        "\$50 for 1M tokens", false),

    // Anthropic Models
    AiModel("Claude 3.5 Sonnet", "vision", "\$90 for 1M tokens", true),
    AiModel("Claude 3 Haiku", "general-purpose", "\$30 for 1M tokens", false),

    // Groq Models
    AiModel("DeepSeek R1-Distill Llama 3.3 70B (Preview)", "general-purpose",
        "\$40 for 1M tokens", false),
    AiModel("LLaMA 3.3 70B", "general-purpose", "\$60 for 1M tokens", true),
    AiModel("LLaMA 3.2 1B (Preview)", "low-cost", "\$10 for 1M tokens", false),
    AiModel("LLaMA 3.2 3B (Preview)", "low-cost", "\$15 for 1M tokens", false),
    AiModel(
        "LLaMA 3.2 1B Vision (Preview)", "vision", "\$12 for 1M tokens", false),
    AiModel(
        "LLaMA 3.2 90B Vision (Preview)", "vision", "\$70 for 1M tokens", true),
    AiModel("LLaMA 3.1 8B", "low-cost", "\$20 for 1M tokens", false),
    AiModel("LLaMA 3 8B (Deprecated)", "general-purpose", "\$25 for 1M tokens",
        false),
    AiModel("LLaMA 3 70B", "general-purpose", "\$50 for 1M tokens", false),
    AiModel("Mixtral 8x7B (Deprecated)", "general-purpose",
        "\$45 for 1M tokens", false),
    AiModel("Gemma 2 9B", "general-purpose", "\$35 for 1M tokens", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Configuration.',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 12.0),
              CustomModelSettingsWidget(
                title: 'Summary Max Tokens',
                subtitle:
                    'The maximum length of the generated summary (in tokens).',
              ),
              SizedBox(height: 16.0),
              CustomModelSettingsWidget(
                title: 'Transcript Max Lines',
                subtitle:
                    'The maximum of lines to include in the transcript. (0 to disable)',
              ),
              SizedBox(height: 8.0),
              Divider(color: Colors.grey.shade400),
              SizedBox(height: 8.0),
              CustomTextWidget(
                text: 'Model.',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              CustomTextWidget(
                text: 'Model to use for summary generation.',
                maxLines: 4,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                textColor: AppColors.lightTextColor,
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: CustomDropdown.search(
                  hintText: 'Select Model',
                  headerBuilder: (context, selectedItem, enabled) {
                    return CustomTextWidget(
                      text: selectedItem.name,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.lightTextColor,
                    );
                  },
                  decoration: CustomDropdownDecoration(
                    closedFillColor: Colors.transparent,
                    expandedFillColor: Theme.of(context).colorScheme.surface,
                    expandedBorderRadius: BorderRadius.circular(8.0),
                    expandedBorder: Border.all(color: Colors.red.shade300),
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    searchFieldDecoration: SearchFieldDecoration(
                      fillColor: Colors.white60,
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Colors.black54,
                      ),
                      textStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    noResultFoundStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    headerStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                    listItemStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                    listItemDecoration: ListItemDecoration(
                      selectedColor: Colors.grey.shade300,
                    ),
                  ),
                  listItemBuilder: (context, item, isSelected, onItemSelect) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                maxLines: 1,
                                style: TextStyle(
                                    color: AppColors.blackTextColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                item.price,
                                maxLines: 1,
                                style: TextStyle(
                                    color: AppColors.lightTextColor,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Visibility(
                          visible: item.isRecommended,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: CustomTextWidget(
                              text: 'Recommended',
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              textColor: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: CustomTextWidget(
                            text: item.purpose,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            textColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                      // selected: isSelected,
                    ); // onTap: onItemSelect);
                  },
                  items: aiModelsList,
                  excludeSelected: false,
                  onChanged: (value) {
                    log('changing value to: $value');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomModelSettingsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomModelSettingsWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: title,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              CustomTextWidget(
                text: subtitle,
                fontSize: 12.0,
                maxLines: 2,
                fontWeight: FontWeight.w400,
                textColor: AppColors.lightTextColor,
              ),
            ],
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: TextFormField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                  border: InputBorder.none,
                  hintText: '2048',
                  hintStyle: TextStyle(color: Colors.grey),
                  isCollapsed: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  suffixIcon: Column(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Colors.red.shade300,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.red.shade300,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
