import 'dart:convert';

import 'package:http/http.dart';

import '../model/Article.dart';

class ApiService {
  Future<List<Article>> getArticle() async {
    final endPointUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2022-12-13&to=2022-12-13&sortBy=popularity&apiKey=e4dd57e331be4bb9b9867617303f9590";
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getDynamicArticle(String keyword) async {
    final dynamicEndPointUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=$keyword&apiKey=e4dd57e331be4bb9b9867617303f9590";

    Response res = await get(dynamicEndPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getPopularArticle() async {
    final endPointUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e4dd57e331be4bb9b9867617303f9590";
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
