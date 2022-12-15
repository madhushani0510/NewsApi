import 'dart:convert';

import 'package:http/http.dart';

import '../model/Article.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=apple&from=2022-12-13&to=2022-12-13&sortBy=popularity&apiKey=ac8f9d69fbb9478b8307548f3c9a3c73";

  Future<List<Article>> getArticle() async {
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
