import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_project_news_app/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {

 final NewsModel newsModel;

  const NewsDetails({super.key,required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 200,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              imageUrl: widget.newsModel.urlToImage.toString(),
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
                  child: Text(widget.newsModel.source!.name.toString(),style: TextStyle(
                    color: Colors.white
                  ),),
                  ),
                  SizedBox(width: 8,),
                  Text(widget.newsModel.publishedAt.toString()),
               ],
             ),
             SizedBox(height: 8,),
             Text(widget.newsModel.author==null ?"":
              "Written By-   " + widget.newsModel.author.toString()),
              SizedBox(height: 8,),
              Text(widget.newsModel.title.toString()),
              SizedBox(height: 8,),
              Text(widget.newsModel.description.toString()),
              SizedBox(height: 8,),

              ElevatedButton(onPressed: ()async{
               final Uri uri = Uri.parse(widget.newsModel.url.toString());
               if (!await launchUrl(uri)){
                throw Exception("Could Not Launch");
               }
              }, child: Text("Read more..."))
          ],
        ),
      ),
    );
  }
}