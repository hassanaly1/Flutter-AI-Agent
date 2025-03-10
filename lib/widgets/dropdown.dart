import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String hintText;
  final List<dynamic>? items;
  final dynamic Function(dynamic)? onChanged;
  const CustomDropdownWidget({
    super.key,
    required this.hintText,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: CustomDropdown(
        hintText: hintText,
        headerBuilder: (context, selectedItem, enabled) {
          return CustomTextWidget(
            text: selectedItem.title,
            textAlign: TextAlign.start,
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
          // searchFieldDecoration: SearchFieldDecoration(
          //   fillColor: Colors.white60,
          //   prefixIcon: Icon(
          //     CupertinoIcons.search,
          //     color: Colors.black54,
          //   ),
          //   textStyle: TextStyle(
          //     color: Colors.black54,
          //     fontFamily: 'Poppins',
          //     fontSize: 12.0,
          //     fontWeight: FontWeight.w400,
          //   ),
          //   hintStyle: TextStyle(
          //     color: Colors.black54,
          //     fontFamily: 'Poppins',
          //     fontSize: 12.0,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
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
                child: CustomTextWidget(
                  text: item.title,
                  textAlign: TextAlign.start,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            // selected: isSelected,
          ); // onTap: onItemSelect);
        },
        items: items,
        excludeSelected: false,
        onChanged: onChanged,
      ),
    );
  }
}
