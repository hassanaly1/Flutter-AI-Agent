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
        title: Text(
          'Train your AI Agent',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Train your AI Agents with dynamic knowledge from projects, web links, documents and more. Learn how to optimize your agent.',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Instructions',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 2.0),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white54,
                hintText: 'Enter Instructions',
                hintStyle: TextStyle(color: Colors.black54),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, width: 2.0),
                ),
              ),
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(height: 8.0),
            SwitchListTile.adaptive(
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (value) {},
              title: Text(
                'Enable Knowledge',
                style: GoogleFonts.poppins(
                    fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Add Sources +',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
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
                    Text(
                      'Upload files here and select upload.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Files supported(.pdf, .doc, .txt, .md, .pptx, .vlxs, .csv, .xlsx, .epub, .png, .jpg, .jpeg).',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
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
                  child: Text(
                    'Title',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 2,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    'Status',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Type',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
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
              status: ProjectUploadStatus.pending,
              type: 'Project',
            ),
            Divider(color: Colors.grey.shade300, thickness: 2.0),
            CustomProjectList(
              text: 'Get Started',
              status: ProjectUploadStatus.completed,
              type: 'pdf',
            ),
            Divider(color: Colors.grey.shade300, thickness: 2.0),
            CustomProjectList(
              text: 'CV',
              status: ProjectUploadStatus.rejected,
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
        Icon(Icons.file_copy_outlined),
        SizedBox(width: 8.0),
        Expanded(
          flex: 3,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: status == ProjectUploadStatus.pending
                    ? Theme.of(context).colorScheme.primary
                    : status == ProjectUploadStatus.completed
                        ? Colors.green
                        : status == ProjectUploadStatus.rejected
                            ? Colors.red
                            : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  status == ProjectUploadStatus.pending
                      ? 'Pending'
                      : status == ProjectUploadStatus.completed
                          ? 'Completed'
                          : status == ProjectUploadStatus.rejected
                              ? 'Rejected'
                              : 'N/A',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            type,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
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
  pending,
  completed,
  rejected,
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
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
