import 'package:ai_agent/views/screenshots/screenshot_detail.dart';
import 'package:ai_agent/widgets/app_colors.dart';
import 'package:ai_agent/widgets/custom_text.dart';
import 'package:ai_agent/widgets/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SprintModel {
  final String title;

  SprintModel({required this.title});
}

class CompanyModel {
  final String title;

  CompanyModel({required this.title});
}

class ScreenShotsScreen extends StatefulWidget {
  const ScreenShotsScreen({super.key});

  @override
  State<ScreenShotsScreen> createState() => _ScreenShotsScreenState();
}

class _ScreenShotsScreenState extends State<ScreenShotsScreen> {
  List<SprintModel> sprintList = [
    SprintModel(title: 'All'),
    SprintModel(title: 'Today'),
    SprintModel(title: 'This Week'),
    SprintModel(title: 'This Month'),
    SprintModel(title: 'Last Month'),
    SprintModel(title: 'This Year'),
    SprintModel(title: 'Select Range'),
  ];

  List<CompanyModel> companyList = [
    CompanyModel(title: 'KDataScience Company'),
    CompanyModel(title: '1ViewBusiness'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const CustomTextWidget(
            text: "Screenshots",
            fontSize: 16.0,
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorAnimation: TabIndicatorAnimation.linear,
            dividerColor: Colors.grey.shade200,
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor:
                Theme.of(context).primaryColor.withValues(alpha: 0.6),
            labelStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            unselectedLabelColor: Colors.grey.shade600,
            tabs: [
              Tab(text: 'Screenshots'),
              Tab(text: 'Live View'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AllScreenshotsView(
              sprintList: sprintList,
              companyList: companyList,
            ),
            Center(
              child: Image.asset(
                'assets/images/coming_soon.png',
                height: 200.0,
                width: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllScreenshotsView extends StatefulWidget {
  const AllScreenshotsView({
    super.key,
    required this.sprintList,
    required this.companyList,
  });

  final List<SprintModel> sprintList;
  final List<CompanyModel> companyList;

  @override
  State<AllScreenshotsView> createState() => _AllScreenshotsViewState();
}

class _AllScreenshotsViewState extends State<AllScreenshotsView> {
  bool _isAnySelected = false;

  void _updateSelection(bool isSelected) {
    setState(() {
      _isAnySelected = isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.32,
              backgroundColor: AppColors.whiteTextColor,
              flexibleSpace: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomDropdownWidget(
                      hintText: 'Me',
                      items: [],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AllTimesWidget(sprintList: widget.sprintList),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              border: Border.all(color: Colors.black38),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    CupertinoIcons.delete_solid,
                    color: _isAnySelected ? Colors.red : Colors.transparent,
                  ),
                ),
                CustomSprintExpandedTile(
                  title: '24th February 2025',
                  onSelectionChanged: _updateSelection,
                ),
                CustomSprintExpandedTile(
                  title: '23rd February 2025',
                  onSelectionChanged: _updateSelection,
                ),
                CustomSprintExpandedTile(
                  title: '22nd February 2025',
                  onSelectionChanged: _updateSelection,
                ),
                CustomSprintExpandedTile(
                  title: '21st February 2025',
                  onSelectionChanged: _updateSelection,
                ),
                CustomSprintExpandedTile(
                  title: '20th February 2025',
                  onSelectionChanged: _updateSelection,
                ),
                CustomSprintExpandedTile(
                  title: '19th February 2025',
                  onSelectionChanged: _updateSelection,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSprintExpandedTile extends StatefulWidget {
  final String title;
  final Function(bool) onSelectionChanged;
  const CustomSprintExpandedTile(
      {super.key, required this.title, required this.onSelectionChanged});

  @override
  State<CustomSprintExpandedTile> createState() =>
      _CustomSprintExpandedTileState();
}

class _CustomSprintExpandedTileState extends State<CustomSprintExpandedTile> {
  bool _isAllSelected = false;
  List<bool> _selectedItems = List.generate(8, (index) => false);

  void _toggleAll(bool? value) {
    setState(() {
      _isAllSelected = value ?? false;
      _selectedItems = List.generate(8, (index) => _isAllSelected);

      // Notify parent if any checkbox is selected
      widget.onSelectionChanged(_selectedItems.contains(true));
    });
  }

  void _toggleItem(int index, bool? value) {
    setState(() {
      _selectedItems[index] = value ?? false;
      _isAllSelected = _selectedItems.every((element) => element);

      // Notify parent if any checkbox is selected
      widget.onSelectionChanged(_selectedItems.contains(true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: ExpansionTile(
        title: CustomTextWidget(
          text: widget.title,
          textColor: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          textAlign: TextAlign.start,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        childrenPadding: EdgeInsets.all(4.0),
        controlAffinity: ListTileControlAffinity.leading,
        visualDensity: VisualDensity.compact,
        backgroundColor: Theme.of(context).colorScheme.surface,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            value: _isAllSelected,
            onChanged: _toggleAll,
            title: CustomTextWidget(
              text: '11 AM',
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            visualDensity: VisualDensity.compact,
            activeColor: AppColors.primaryColor,
            checkColor: AppColors.whiteTextColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            shrinkWrap: true,
            itemCount: 8,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    sheetAnimationStyle: AnimationStyle(
                      duration: const Duration(milliseconds: 500),
                    ),
                    isScrollControlled: true,
                    enableDrag: true,
                    showDragHandle: true,
                    builder: (context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.6,
                        minChildSize: 0.5,
                        maxChildSize: 1.0,
                        expand: false,
                        builder: (context, scrollController) {
                          return ScreenshotDetailDialog(
                            controller: scrollController,
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey.shade400),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXDONvtOJdpnR5mLnA3HMoeZZ_jl0vDxunFA&s')),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Checkbox(
                      value: _selectedItems[index],
                      onChanged: (value) => _toggleItem(index, value),
                      visualDensity: VisualDensity.compact,
                      activeColor: AppColors.primaryColor,
                      checkColor: AppColors.whiteTextColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class AllTimesWidget extends StatelessWidget {
  const AllTimesWidget({
    super.key,
    required this.sprintList,
  });

  final List<SprintModel> sprintList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomHoursWidget(
              heading: 'Recorded Hours',
              hours: '02',
              minutes: '30',
            ),
            CustomTextWidget(text: '-', fontWeight: FontWeight.w500),
            CustomHoursWidget(
              heading: 'Idle Hours',
              hours: '02',
              minutes: '30',
            ),
            CustomTextWidget(text: '-', fontWeight: FontWeight.w500),
            CustomHoursWidget(
              heading: 'Deleted Hours',
              hours: '02',
              minutes: '30',
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomHoursWidget(
              heading: 'Low Activity Hours',
              hours: '02',
              minutes: '30',
            ),
            Row(
              spacing: 16.0,
              children: [
                CustomTextWidget(text: '=', fontWeight: FontWeight.w500),
                CustomHoursWidget(
                  heading: 'Total Hours',
                  hours: '12',
                  minutes: '30',
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Flexible(
              child: CustomDropdownWidget(
                hintText: 'Select Sprint',
                items: sprintList,
                onChanged: (val) {
                  if (val is SprintModel) {
                    if (val.title == 'Select Range') {
                      _showDateRangePicker(context);
                    }
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () {},
              visualDensity: VisualDensity.compact,
              icon: Icon(CupertinoIcons.refresh_circled_solid),
              color: Colors.black87,
            ),
          ],
        ),
      ],
    );
  }

  void _showDateRangePicker(context) {
    showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(Duration(days: 3)),
        end: DateTime.now(),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              rangePickerBackgroundColor: Colors.white54,
              rangeSelectionBackgroundColor:
                  AppColors.primaryColor.withValues(alpha: 0.4),
              rangeSelectionOverlayColor:
                  WidgetStateProperty.all(Colors.white38),
            ),
          ),
          child: child!,
        );
      },
    );
  }
}

class CustomHoursWidget extends StatelessWidget {
  final String heading;
  final String hours;
  final String minutes;
  const CustomHoursWidget({
    super.key,
    required this.heading,
    required this.hours,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          text: heading,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: hours,
                style: TextStyle(fontSize: 12.0),
              ),
              TextSpan(
                text: 'H',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              TextSpan(
                text: ' $minutes',
                style: TextStyle(fontSize: 12.0),
              ),
              TextSpan(
                text: 'M',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
