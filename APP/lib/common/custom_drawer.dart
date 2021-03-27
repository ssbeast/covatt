import 'package:covatt/common/drawer_listtile.dart';
import 'package:covatt/models/user.dart';
import 'package:covatt/services/get_it.dart';
import 'package:covatt/services/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final UserData user;

  const CustomDrawer({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final NavigationService _navigationService =
      get_it_instance_const<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(color: Colors.white),
              currentAccountPicture: CircleAvatar(
                radius: 25.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage: NetworkImage(widget.user.imageURL),
              ),
              accountName: Text(
                widget.user.name,
                style: TextStyle(color: Colors.black, fontSize: 23.0),
                textAlign: TextAlign.left,
              ),
              accountEmail: Text(
                widget.user.role,
                style: TextStyle(color: Colors.black, fontSize: 17.0),
              ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 0,
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),

            Visibility(
              visible: (widget.user.role == "vaccinator"), // condition here
              child: DrawerListTile(
                name: "Admin Panel",
                icon: Icons.admin_panel_settings,
                onTap: () {
                  _navigationService.popAllAndReplace('/admin_screen',
                      arguments: {'user': widget.user});
                },
              ),
            ),
            DrawerListTile(
              name: "Dashboard",
              icon: Icons.dashboard,
              onTap: () {
                _navigationService.popAllAndReplace('/first_screen',
                    arguments: {'user': widget.user});
              },
            ),
            DrawerListTile(
              name: "Family",
              icon: Icons.family_restroom,
              onTap: () {
                _navigationService.popAllAndReplace('/family_screen',
                    arguments: {'user': widget.user});
              },
            ),

            DrawerListTile(
              name: "QR Code",
              icon: Icons.qr_code,
              onTap: () {
                _navigationService.popAllAndReplace('/qr_screen');
              },
            ),

            // DrawerListTile(
            //   name: "Family",
            //   icon: Icons.family_restroom,
            //   route: '/',
            //   isSelected: false,
            // ),
            DrawerListTile(
              name: "Feedback",
              icon: Icons.feedback,
              onTap: () {
                _navigationService.popAllAndReplace('/feedback',
                    arguments: {'user': widget.user});
              },
            ),
            DrawerListTile(
              name: "Report Symptom",
              icon: Icons.bug_report,
              onTap: () {
                _navigationService.popAllAndReplace('/reportSymptom',
                    arguments: {'user': widget.user});
              },
            ),
            DrawerListTile(
              name: "Logout",
              icon: Icons.logout,
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                _navigationService.popAllAndReplace('/splash_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
