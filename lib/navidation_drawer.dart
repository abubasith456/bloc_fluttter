import 'package:bloc_flutter/routes/pageRoutes.dart';
import 'package:bloc_flutter/widget/createDrawer.dart';
import 'package:flutter/material.dart';
import '../widget/createHeader.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.cabin,
            text: 'Covid',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.covidPage),
          ),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.person,
            text: 'AboutUs',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.aboutUs),
          ),
          createDrawerBodyItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.settings),
          ),
          ListTile(
            title: const Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
