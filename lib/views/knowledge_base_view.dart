import 'package:ai_agent/widgets/custom_text.dart';
import 'package:ai_agent/widgets/heading_and_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KnowledgeBaseView extends StatefulWidget {
  const KnowledgeBaseView({
    super.key,
  });

  @override
  State<KnowledgeBaseView> createState() => _KnowledgeBaseViewState();
}

class _KnowledgeBaseViewState extends State<KnowledgeBaseView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: CustomTextWidget(
          text: 'Train your AI Agent',
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text:
                  'Train your AI Agents with dynamic knowledge from projects, web links, documents and more. Learn how to optimize your agent.',
              fontSize: 14.0,
              maxLines: 5,
              fontWeight: FontWeight.w400,
              textColor: Colors.black54,
            ),
            SizedBox(height: 8.0),
            HeadingAndTextField(
              title: 'Instructions',
              fontSize: 16.0,
              hintText: 'Enter Instructions',
              maxLines: 6,
            ),
            SizedBox(height: 8.0),
            SwitchListTile.adaptive(
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (value) {},
              title: CustomTextWidget(
                text: 'Enable Knowledge',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.0),
            CustomTextWidget(
              text: 'Add Sources +',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 4.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey.shade300, width: 2.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.cloud_upload,
                      size: 40.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    CustomTextWidget(
                      text: 'Upload files here and select upload.',
                      fontSize: 14.0,
                      textColor: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CustomTextWidget(
                        text:
                            'Files supported(.pdf, .doc, .txt, .md, .pptx, .vlxs, .csv, .xlsx, .epub, .png, .jpg, .jpeg).',
                        fontSize: 10.0,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        textColor: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(child: CustomAddCard(text: 'Add Project.')),
                Expanded(child: CustomAddCard(text: 'Add Media.')),
              ],
            ),
            Row(
              children: [
                Expanded(child: CustomAddCard(text: 'Add Link.')),
                Expanded(child: CustomAddCard(text: 'Add Youtube.')),
              ],
            ),
            CustomAddCard(
                text: 'Add using Google Drive, Dropbox and OneDrive.'),
            CustomAddCard(text: 'Add Youtube.'),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.file_copy_outlined, color: Colors.transparent),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 3,
                  child: CustomTextWidget(
                    text: 'Title',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: CustomTextWidget(
                    text: 'Status',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: CustomTextWidget(
                    text: 'Type',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Icon(Icons.more_horiz, color: Colors.transparent),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade300, thickness: 2.0),
            CustomProjectList(
              text: 'Project',
              status: ProjectUploadStatus.notReady,
              type: 'Project',
            ),
            Divider(color: Colors.grey.shade300, thickness: 2.0),
            CustomProjectList(
              text: 'Get Started PDF',
              status: ProjectUploadStatus.ready,
              type: 'pdf',
            ),
            Divider(color: Colors.grey.shade300, thickness: 2.0),
            CustomProjectList(
              text: 'CV',
              status: ProjectUploadStatus.ready,
              type: '.doc',
            ),
            SizedBox(height: 16.0),
          ],
        ),
      )),
    );
  }
}

class CustomProjectList extends StatelessWidget {
  final String text;
  final ProjectUploadStatus status;
  final String type;
  const CustomProjectList({
    super.key,
    required this.text,
    required this.status,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(CupertinoIcons.doc),
        SizedBox(width: 8.0),
        Expanded(
          flex: 3,
          child: CustomTextWidget(
            text: text,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: status == ProjectUploadStatus.notReady
                    ? Theme.of(context).colorScheme.primary
                    : status == ProjectUploadStatus.ready
                        ? Colors.green
                        : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: CustomTextWidget(
                  text: status == ProjectUploadStatus.notReady
                      ? 'Not Ready'
                      : status == ProjectUploadStatus.ready
                          ? 'Ready'
                          : 'N/A',
                  fontSize: 12.0,
                  textColor: Colors.white,
                ),
              )),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 2,
          child: CustomTextWidget(text: type),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}

enum ProjectUploadStatus {
  notReady,
  ready,
}

class CustomAddCard extends StatelessWidget {
  final String text;
  const CustomAddCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade300, width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Icon(
                CupertinoIcons.cloud_upload,
                size: 25.0,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 8.0),
            Flexible(
              child: CustomTextWidget(
                  text: text,
                  maxLines: 2,
                  textColor: Colors.black54,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
