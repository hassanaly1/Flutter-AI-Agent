import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeZoneModel {
  final String name;
  final String abbreviation;
  final String offset;

  TimeZoneModel(this.name, this.abbreviation, this.offset);
}

class TimeZoneScreen extends StatefulWidget {
  const TimeZoneScreen({super.key});

  @override
  _TimeZoneScreenState createState() => _TimeZoneScreenState();
}

class _TimeZoneScreenState extends State<TimeZoneScreen> {
  List<TimeZoneModel> timeZonesList = [
    TimeZoneModel("Pacific Standard Time", "PST", "UTC-08:00"),
    TimeZoneModel("Mountain Standard Time", "MST", "UTC-07:00"),
    TimeZoneModel("Central Standard Time", "CST", "UTC-06:00"),
    TimeZoneModel("Eastern Standard Time", "EST", "UTC-05:00"),
    TimeZoneModel("Greenwich Mean Time", "GMT", "UTC+00:00"),
    TimeZoneModel("Central European Time", "CET", "UTC+01:00"),
    TimeZoneModel("Eastern European Time", "EET", "UTC+02:00"),
    TimeZoneModel("India Standard Time", "IST", "UTC+05:30"),
    TimeZoneModel("China Standard Time", "CST", "UTC+08:00"),
    TimeZoneModel("Japan Standard Time", "JST", "UTC+09:00"),
    TimeZoneModel("Australian Eastern Standard Time", "AEST", "UTC+10:00"),
    TimeZoneModel("New Zealand Standard Time", "NZST", "UTC+12:00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const CustomTextWidget(
            text: "Time Zones",
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
                text: 'Select Timezone',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: CustomDropdown.search(
                  hintText: 'Select Timezone',
                  headerBuilder: (context, selectedItem, enabled) {
                    return CustomTextWidget(
                      text: selectedItem.name,
                      textAlign: TextAlign.center,
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
                                item.abbreviation,
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
                            text: item.offset,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            textColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                      // selected: isSelected,
                    ); // onTap: onItemSelect);
                  },
                  items: timeZonesList,
                  excludeSelected: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ));
  }
}
