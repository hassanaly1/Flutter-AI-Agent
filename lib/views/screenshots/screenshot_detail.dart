import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenshotDetailDialog extends StatefulWidget {
  const ScreenshotDetailDialog({super.key});

  @override
  State<ScreenshotDetailDialog> createState() => _ScreenshotDetailDialogState();
}

class _ScreenshotDetailDialogState extends State<ScreenshotDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey.shade400),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://opengraph.githubassets.com/c615bf3406261bdc8b10b8af91195b8fc73db25a77c7d68eb7574ebed89cbf1d/Delunado/RandomScreenshotPrnt')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: CustomTextWidget(
                          text: '23164 - Screenshots Screens Designing.',
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.delete_simple,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(CupertinoIcons.multiply_circle),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  CustomListTile(
                    title: 'Workspace:',
                    subtitle: '1ViewBusiness Projects',
                  ),
                  SizedBox(height: 8.0),
                  CustomListTile(
                    title: 'Company:',
                    subtitle: 'KDataScience Solutions Pvt Ltd',
                  ),
                  SizedBox(height: 8.0),
                  CustomListTile(
                    title: 'Time:',
                    subtitle: ' 24-Feb-2025 5:48 PM - 24-Feb-2025 5:42 PM',
                  ),
                  SizedBox(height: 12.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 12.0),
                  CustomRowHeading(
                      heading1: 'Mouse Activity', heading2: 'Count'),
                  CustomRowTile(title: 'Mouse Clicks', subtitle: '46'),
                  CustomRowTile(title: 'Double Clicks', subtitle: '10'),
                  CustomRowTile(title: 'Move Count', subtitle: '105'),
                  CustomRowTile(title: 'Scrolls', subtitle: '02'),
                  CustomRowTile(title: 'Dragger Items', subtitle: 'N/A'),
                  CustomRowTile(title: 'Device ID', subtitle: '15621'),
                  SizedBox(height: 12.0),
                  CustomRowHeading(
                      heading1: 'Keyboard Activity', heading2: 'Count'),
                  CustomRowTile(title: 'Key Presses', subtitle: '46'),
                  CustomRowTile(title: 'Long Key Presses', subtitle: '10'),
                  SizedBox(height: 12.0),
                  CustomRowHeading(heading1: 'App Name', heading2: 'Seconds'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRowHeading extends StatelessWidget {
  final String heading1;
  final String heading2;
  const CustomRowHeading({
    super.key,
    required this.heading1,
    required this.heading2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: CustomTextWidget(
            text: heading1,
            textColor: Colors.black54,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
        ),
        CustomTextWidget(
          text: heading2,
          textColor: Colors.black54,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomListTile(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          text: title,
          maxLines: 2,
          textColor: Colors.grey,
          textAlign: TextAlign.start,
        ),
        CustomTextWidget(
          text: subtitle,
          maxLines: 2,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class CustomRowTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomRowTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomTextWidget(
              text: title,
              fontSize: 12.0,
              textColor: Colors.grey,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 8.0),
          CustomTextWidget(
            fontSize: 12.0,
            text: subtitle,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
