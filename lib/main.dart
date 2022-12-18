// @dart=2.9
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

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
  String keyword = 'Business';
  static const List<String> entries = <String>[
    'BUSINESS',
    'SCIENCE',
    'ENTERTAINMENT',
    'SPORTS',
    'TECHNOLOGY',
  ];

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
              icon: Icon(Icons.business),
              onPressed: () {
                setState(() {
                  keyword = 'Business';
                  print('$keyword');
                });
                print('Business');
              }),
          IconButton(
              icon: Icon(
                Icons.science,
              ),
              onPressed: () {
                setState(() {
                  keyword = 'Science';
                  print('$keyword');
                });
                print('Science');
                print('Science');
              }),
          IconButton(
              icon: Icon(
                Icons.music_note,
              ),
              onPressed: () {
                print('Entertainment');
              }),
          IconButton(
              icon: Icon(
                Icons.sports_baseball,
              ),
              onPressed: () {
                print('Sports');
              }),
          IconButton(
              icon: Icon(
                Icons.computer,
              ),
              onPressed: () {
                print('Technology');
              }),
        ],
        ringColor: Colors.amber,
        ringDiameter: 350,
        ringWidth: 150 * 0.3,
        fabSize: 30,
        fabColor: Colors.amber,
        fabOpenColor: Colors.amber,
      ),
    );
  }
}
