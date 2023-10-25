import 'dart:convert';

import 'package:first_project_news_app/model/news_model.dart';
import 'package:http/http.dart';

class ApiService{

  final all_news_uri =
   "https://newsapi.org/v2/everything?q=bitcoin&apiKey=5d95f16323514de4b5f1d0af765cf233";

   final breaking_news_uri =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=5d95f16323514de4b5f1d0af765cf233";

  Future <List<NewsModel>> getAllNews()async{

    try{
      Response response = await get(Uri.parse(breaking_news_uri));

      if (response.statusCode ==200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<NewsModel> articleslist =body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }
      else {
        throw ("No news found");
      }

    }catch(e){
      print(e.toString());
     throw e;
    }
  }

   Future <List<NewsModel>> getBreakingNews()async{

    try{
      Response response = await get(Uri.parse(all_news_uri));

      if (response.statusCode ==200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json["articles"];
        List<NewsModel> articleslist =body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }
      else {
        throw ("No news found");
      }

    }catch(e){
     throw e;
    }
  }

}