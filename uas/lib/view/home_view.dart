import 'package:flutter/material.dart';

import 'package:uas/model/article_model.dart';
import '../service/api_service.dart';
import 'package:uas/components/custom_ListTile.dart';

class HomeView extends StatefulWidget {
  final Article article;

  const HomeView({Key key, this.article}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Article>> article;

  @override
  void initState() {
    super.initState();
    article = ApiService().getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nia Ardiati"),
      ),
      body: FutureBuilder(
        future: article,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article> listArticle = snapshot.data;
            return ListView.builder(
              itemCount: listArticle.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  customListTile(listArticle[index], context),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}