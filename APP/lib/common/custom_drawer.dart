import 'package:covatt/common/drawer_listtile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final String name;
  final String subtitle;
  final String imageURL;

  const CustomDrawer({Key key, this.name, this.subtitle, this.imageURL})
      : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(color: Colors.white),
            currentAccountPicture: CircleAvatar(
              radius: 25.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: NetworkImage(widget.imageURL),
            ),
            accountName: Text(
              widget.name,
              style: TextStyle(color: Colors.black, fontSize: 23.0),
              textAlign: TextAlign.left,
            ),
            accountEmail: Text(
              widget.subtitle,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          DrawerListTile(name: "Dashboard", icon: Icons.dashboard, route: '/'),
          DrawerListTile(name: "Profile", icon: Icons.face, route: '/'),
          DrawerListTile(
              name: "Family", icon: Icons.family_restroom, route: '/'),
          DrawerListTile(name: "Feedback", icon: Icons.feedback, route: '/'),
          DrawerListTile(
              name: "Report Symptom", icon: Icons.bug_report, route: '/'),
          DrawerListTile(name: "Logout", icon: Icons.logout, route: '/'),
        ],
      ),
    );
  }
}
