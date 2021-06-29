import 'dart:convert';

import 'package:http/http.dart';
import 'package:uas/model/article_model.dart';

class ApiService {
  final endPointUrl ="https://jaroji.web.id/api/news.php";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['berita'];
      List<Article> berita =
          body.map((dynamic item) => Article.fromJSON(item)).toList();

      return berita;
    } else {
      throw ("Can't get the Article");
    }
  }
}