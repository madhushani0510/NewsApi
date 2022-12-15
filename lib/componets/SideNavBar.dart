import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/CategoryScreen.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              accountName: Text('TEST'),
              accountEmail: Text('TEST'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                    // child: Image.network(
                    //     height: 100,
                    //     width: 100,
                    //     fit: BoxFit.cover,
                    //     'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                    ),
              )),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('TEST 1'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('TEST 2'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('TEST 3'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('TEST 4'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('TEST 5'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoryScreen()));
            },
          ),
        ],
      ),
    );
  }
}
