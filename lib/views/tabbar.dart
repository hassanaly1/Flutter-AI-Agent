import 'package:ai_agent/views/chat_view.dart';
import 'package:ai_agent/views/flow_view.dart';
import 'package:ai_agent/views/knowledge_base_view.dart';
import 'package:ai_agent/views/model_view.dart';
import 'package:ai_agent/views/webchat_view/web_chat_view.dart';
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
            title: Text('AI Agent',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
            centerTitle: true,
          ),
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                dividerColor: Colors.grey.shade200,
                tabAlignment: TabAlignment.center,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
                unselectedLabelColor: Colors.grey.shade600,
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
