import 'package:ai_agent/views/chat_view.dart';
import 'package:ai_agent/views/flow_view.dart';
import 'package:ai_agent/views/knowledge_base_view.dart';
import 'package:ai_agent/views/model_view.dart';
import 'package:ai_agent/views/web_chat_view.dart';
import 'package:flutter/material.dart';

class TabbarScreen extends StatelessWidget {
  const TabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('AI Agent'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                dividerColor: Colors.grey.shade200,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'Chat'),
                  Tab(text: 'Knowledge Base'),
                  Tab(text: 'Flow'),
                  Tab(text: 'Model'),
                  Tab(text: 'Web Chat'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ChatView(),
                    KnowledgeBaseView(),
                    FlowView(),
                    ModelView(),
                    WebChatView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
