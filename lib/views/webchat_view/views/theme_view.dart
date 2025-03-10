import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_button.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  String themeInitialValue = 'Light';
  var themes = ['Light', 'Dark'];
  String fontInitialValue = 'Poppins';
  var fonts = ['Poppins', 'Inter', 'Rubik'];
  String variantInitialValue = 'Soft';
  var variants = ['Soft', 'Solid'];
  double sliderValue = 0.0;
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
                text: 'Theme Styler.',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
              CustomTextWidget(
                text: 'Customize the look and feel of your bot.',
                fontSize: 14.0,
                textColor: AppColors.lightTextColor,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.0),
              Divider(color: Colors.grey),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Theme',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: DropdownButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0),
                            isDense: true,
                            isExpanded: true,
                            dropdownColor:
                                Theme.of(context).colorScheme.surface,
                            value: themeInitialValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: themes.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: CustomTextWidget(text: items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                themeInitialValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Font',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: DropdownButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0),
                            isDense: true,
                            isExpanded: true,
                            dropdownColor:
                                Theme.of(context).colorScheme.surface,
                            value: fontInitialValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: fonts.map((String font) {
                              return DropdownMenuItem(
                                value: font,
                                child: CustomTextWidget(text: font),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                fontInitialValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Variant',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: DropdownButton(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0),
                            isDense: true,
                            isExpanded: true,
                            dropdownColor:
                                Theme.of(context).colorScheme.surface,
                            value: variantInitialValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: variants.map((String font) {
                              return DropdownMenuItem(
                                value: font,
                                child: CustomTextWidget(text: font),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                variantInitialValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.0),
              CustomTextWidget(
                text: 'Radius',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  sliderTheme: SliderThemeData(
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    showValueIndicator: ShowValueIndicator.always,
                  ),
                ),
                child: Slider.adaptive(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  min: 0.0,
                  max: 16.0,
                  label: sliderValue.round().toString(),
                  allowedInteraction: SliderInteraction.tapAndSlide,
                  inactiveColor: Colors.grey.shade300,
                  thumbColor: Colors.white,
                ),
              ),
              CustomTextWidget(
                text: 'Theme',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              ColorPicker(
                onColorChanged: (value) {},
                borderColor: Colors.black54,
                tonalColorSameSize: true,
                showColorCode: true,
                showColorName: true,
                showEditIconButton: true,
                colorCodeReadOnly: true,
                colorCodeHasColor: true,
                colorNameTextStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
                colorCodeTextStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                enableTonalPalette: true,
                wheelHasBorder: true,
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
