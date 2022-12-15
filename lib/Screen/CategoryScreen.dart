// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../componets/SideNavBar.dart';
import '../componets/customListTile.dart';
import '../model/Article.dart';
import '../service/ApiService.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  static const List<String> entries = <String>[
    'SPORTS',
    'BUSINESS',
    'TECHNOLOGY',
    'WEATHER'
  ];

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();

    return Scaffold(
      drawer: SideNavBar(),
      appBar: AppBar(
        title: const Text("Category", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: entries.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      '${entries[index]}',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  color: Color.fromARGB(255, 238, 241, 7),
                ),
              ),
            ),
            Flexible(
              child: FutureBuilder(
                future: client.getArticle(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  //let's check if we got a response or not
                  if (snapshot.hasData) {
                    //Now let's make a list of articles
                    List<Article> articles = snapshot.data;
                    return ListView.builder(
                      //Now let's create our custom List tile
                      itemCount: articles?.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
