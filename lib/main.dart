// @dart=2.9
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapi/service/ApiService.dart';

import 'componets/customListTile.dart';
import 'componets/SideNavBar.dart';
import 'model/Article.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  bool floatExtended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavBar(),
      appBar: AppBar(
        title: const Text(
          "NEWS APP",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
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
      floatingActionButton: FabCircularMenu(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('Home');
              }),
          IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: () {
                print('Favorite');
              })
        ],
        ringColor: Colors.amber,
        ringDiameter: 200,
        ringWidth: 150 * 0.3,
        fabSize: 50,
        fabColor: Colors.amber,
        fabOpenColor: Colors.amber,
      ),
    );
  }
}
