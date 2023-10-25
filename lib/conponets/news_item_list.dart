import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project_news_app/Ui/news_details.dart';
import 'package:first_project_news_app/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsItemList extends StatelessWidget {

 final NewsModel newsModel;

  const NewsItemList({super.key,required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {Navigator.push(context, MaterialPageRoute(
        builder: (context) => NewsDetails(newsModel: newsModel)));},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.symmetric(horizontal: 11),
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           CachedNetworkImage(
            height: 200,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            imageUrl: newsModel.urlToImage.toString(),
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
           ),
           SizedBox(height: 8,),
           Row(
             children: [
               Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.horizontal(right:Radius.circular(8)),
                ),
                child: Text(newsModel.source!.name.toString(),style: TextStyle(
                  color: Colors.white
                ),),
                ),
                SizedBox(width: 8,),
                Text(newsModel.publishedAt.toString()),
             ],
           ),
           SizedBox(height: 8,),
           Text(newsModel.author==null ?"":
            "Written By-   " + newsModel.author.toString()),
            SizedBox(height: 8,),
            Text(newsModel.title.toString()),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}