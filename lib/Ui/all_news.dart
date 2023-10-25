import 'package:first_project_news_app/conponets/news_item_list.dart';
import 'package:first_project_news_app/model/news_model.dart';
import 'package:first_project_news_app/service/api_service.dart';
import 'package:flutter/material.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
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