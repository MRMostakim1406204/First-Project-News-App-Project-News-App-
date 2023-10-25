import 'package:first_project_news_app/conponets/news_item_list.dart';
import 'package:first_project_news_app/model/news_model.dart';
import 'package:first_project_news_app/service/api_service.dart';
import 'package:flutter/material.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

 ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBreakingNews(),
         builder: (context, snapshot){

          if(snapshot.hasData){
            List<NewsModel> articleslist =snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {

                return NewsItemList(newsModel: articleslist[index]);
              },
              itemCount: articleslist.length,);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
         }),
    );
  }
}