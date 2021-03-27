import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  final GlobalKey<ScaffoldState> drawerkey;

  CustomAppBar({Key key, this.title, this.drawerkey})
      : preferredSize = Size.fromHeight(70.0),
        super(key: key);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: 40.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            widget.drawerkey.currentState.openDrawer();
          },
        ),
        centerTitle: false,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27.0,
              color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.language,
                size: 35.0,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                print("Language Icon Clicked");
              },
            ),
          )
        ],
      ),
    );
  }
}
