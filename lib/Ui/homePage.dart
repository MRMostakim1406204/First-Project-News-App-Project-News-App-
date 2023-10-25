import 'package:first_project_news_app/Ui/all_news.dart';
import 'package:first_project_news_app/Ui/breaking_news.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(text: "Breaking News",),
            Tab(text: "All News",),
          ]),
      ),
      body: TabBarView(children: [
        BreakingNews(),
        AllNews(),
      ]),
      ));
      }}