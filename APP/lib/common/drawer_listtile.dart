import 'package:covatt/services/get_it.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  final String name;
  final IconData icon;
  final String route;
  DrawerListTile({Key key, this.name, this.icon, this.route}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name, style: TextStyle(color: Colors.black, fontSize: 20)),
      onTap: () {
        _navigationService.navigateTo(route);
      },
    );
  }
}
