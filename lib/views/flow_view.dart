import 'package:ai_agent/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlowView extends StatefulWidget {
  const FlowView({
    super.key,
  });

  @override
  State<FlowView> createState() => _FlowViewState();
}

class _FlowViewState extends State<FlowView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () => _key.currentState?.openDrawer(),
          child: Icon(Icons.menu_open_rounded),
        ),
      ),
      drawer: FlowDrawerWidget(scaffoldKey: _key),
    );
  }
}

class FlowDrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const FlowDrawerWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: kToolbarHeight * 1.5,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white54,
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white60,
                        hintText: 'Search Cards',
                        hintStyle: TextStyle(color: Colors.black54),
                        suffixIcon: Icon(CupertinoIcons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.black45),
                        ),
                      ),
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(CupertinoIcons.pin_fill)
                ],
              ),
            ),
          ),
          SendMessageExpansionTile(),
          ExecuteExpansionTile(),
          WebChatExpansionTile(),
          BrowserExpansionTile(),
          KnowledgeBaseExpansionTile(),
        ],
      ),
    );
  }
}

class SendMessageExpansionTile extends StatelessWidget {
  const SendMessageExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: CustomTextWidget(
            text: 'Send Messages', fontSize: 16.0, fontWeight: FontWeight.w500),
        visualDensity: VisualDensity.compact,
        backgroundColor: Theme.of(context).colorScheme.surface,
        collapsedTextColor: Colors.black87,
        collapsedBackgroundColor: Colors.grey.shade300,
        collapsedShape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          12.0,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'Text', icon: Icons.sort_by_alpha_sharp),
              ),
              Expanded(
                child:
                    CustomCardWidget(text: 'Image', icon: Icons.image_outlined),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(text: 'Audio', icon: Icons.audiotrack),
              ),
              Expanded(
                child: CustomCardWidget(
                    text: 'Video', icon: Icons.video_call_rounded),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'File', icon: Icons.file_copy_outlined),
              ),
              Expanded(
                child: CustomCardWidget(text: 'Card', icon: Icons.credit_card),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'Carousel', icon: Icons.view_carousel_outlined),
              ),
              Expanded(
                child: CustomCardWidget(
                    text: 'Location', icon: Icons.location_on_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ExecuteExpansionTile extends StatelessWidget {
  const ExecuteExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: CustomTextWidget(
            text: 'Execute', fontSize: 16.0, fontWeight: FontWeight.w500),
        visualDensity: VisualDensity.compact,
        backgroundColor: Theme.of(context).colorScheme.surface,
        collapsedTextColor: Colors.black87,
        collapsedBackgroundColor: Colors.grey.shade300,
        collapsedShape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          12.0,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'Execute Code', icon: Icons.sort_by_alpha_sharp),
              ),
              Expanded(
                child: CustomCardWidget(
                    text: 'Get Record', icon: Icons.file_copy_outlined),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(text: 'Insert Record', icon: Icons.add),
              ),
              Expanded(
                child:
                    CustomCardWidget(text: 'Update Record', icon: Icons.update),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'Delete Record', icon: Icons.delete_outline_outlined),
              ),
              Expanded(
                child:
                    CustomCardWidget(text: 'Find Record', icon: Icons.search),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WebChatExpansionTile extends StatelessWidget {
  const WebChatExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: CustomTextWidget(
            text: 'Webchat', fontSize: 16.0, fontWeight: FontWeight.w500),
        visualDensity: VisualDensity.compact,
        backgroundColor: Theme.of(context).colorScheme.surface,
        collapsedTextColor: Colors.black87,
        collapsedBackgroundColor: Colors.grey.shade300,
        collapsedShape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          12.0,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'Configure Webchat', icon: Icons.share),
              ),
              Expanded(
                child: CustomCardWidget(
                    text: 'Send Custom Webchat', icon: Icons.share),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child:
                    CustomCardWidget(text: 'Get User Data', icon: Icons.share),
              ),
              Expanded(
                child:
                    CustomCardWidget(text: 'Hide Webchat', icon: Icons.share),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child:
                    CustomCardWidget(text: 'Show Webchat', icon: Icons.share),
              ),
              Expanded(
                child:
                    CustomCardWidget(text: 'Toggle Webchat', icon: Icons.share),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BrowserExpansionTile extends StatelessWidget {
  const BrowserExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
        title: CustomTextWidget(
            text: 'Browser', fontSize: 16.0, fontWeight: FontWeight.w500),
        visualDensity: VisualDensity.compact,
        backgroundColor: Theme.of(context).colorScheme.surface,
        collapsedTextColor: Colors.black87,
        collapsedBackgroundColor: Colors.grey.shade300,
        collapsedShape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          12.0,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCardWidget(
                    text: 'Browse Pages', icon: CupertinoIcons.globe),
              ),
              Expanded(
                child: CustomCardWidget(
                    text: 'Capture Screenshots', icon: CupertinoIcons.globe),
              ),
            ],
          ),
          CustomCardWidget(text: 'Web Search', icon: CupertinoIcons.globe),
        ],
      ),
    );
  }
}

class KnowledgeBaseExpansionTile extends StatelessWidget {
  const KnowledgeBaseExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
        title: CustomTextWidget(
            text: 'Knowledge Base Optimizer',
            fontSize: 16.0,
            fontWeight: FontWeight.w500),
        visualDensity: VisualDensity.compact,
        backgroundColor: Theme.of(context).colorScheme.surface,
        collapsedTextColor: Colors.black87,
        collapsedBackgroundColor: Colors.grey.shade300,
        collapsedShape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          12.0,
        ),
        children: [
          CustomCardWidget(
              text: 'Post Install', icon: Icons.file_open_outlined),
        ],
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomCardWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.black12, width: 2.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(width: 4.0),
          Flexible(
            child: CustomTextWidget(
              text: text,
              textColor: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
