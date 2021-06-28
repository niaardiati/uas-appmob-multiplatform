import 'dart:convert';

import 'package:http/http'
import 'package:uas/model/article_model.dart';

class ApiService{
final endPointUrl =
   "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e766d249dc274e80b1c314e389f502ea";

Future<List<Article>> getArticle() async{
  Response res = await get(endPointUrl);

  if(res.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(res.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();
  
  return articles;
  }else {
    throw ("Can't get the Articles");
    }
  }
}