import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String name;
  final IconData icon;

  final Function onTap;
  DrawerListTile({Key key, this.name, this.icon, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.teal[100],
      leading: Icon(icon),
      title: Text(name, style: TextStyle(color: Colors.black, fontSize: 20)),
      onTap: onTap,
    );
  }
}
