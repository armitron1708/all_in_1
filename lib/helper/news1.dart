import 'dart:convert';

import 'package:all_in_1/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  Future<void> getNews()async {

    String url = 'http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=41888c4ff18b45ecbd85095c9d653267';
    var response= await http.get(url);
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null)
          {
            ArticleModel articleModel=ArticleModel(
              title: element['title'],
              author:element['author'],
              description:element['description'],
              url:element['url'],
              urlToImage:element['urlToImage'],
            );
            news.add(articleModel);
          }
      });
    }
  }

}