import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/Screen/PopularScreen.dart';
import 'package:newsapi/Screen/ProfileScreen.dart';
import 'package:newsapi/Screen/SettringScreen.dart';
import 'package:newsapi/main.dart';

import '../Screen/CategoryScreen.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //     decoration: BoxDecoration(color: Colors.red),
            //     accountName: Text('Udara San'),
            //     accountEmail: Text('udarassanjeewa@gmail.com'),
            //     currentAccountPicture: CircleAvatar(
            //       child: ClipOval(
            //         child: Image.network(
            //             height: 100,
            //             width: 100,
            //             fit: BoxFit.cover,
            //             'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
            //       ),
            //     )),
            ListTile(
              title: Text(
                'HOME',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
            ListTile(
              title: Text(
                'CATAGORIES',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryScreen()));
              },
            ),
            ListTile(
              title: Text(
                'TRENDING',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PopularScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
