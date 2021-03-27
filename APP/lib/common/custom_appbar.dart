import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  final GlobalKey<ScaffoldState> drawerkey;

  CustomAppBar({Key key, this.title, this.drawerkey})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.teal, systemNavigationBarColor: Colors.white));
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: 30.0,
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
              fontSize: 25.0,
              color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.language,
                  size: 30.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                color: Colors.teal,
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      'Choose Languages',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                height: 300,
                                child: ListView(
                                  children: [
                                    buildListItem(context, "Hindi (हिन्दी)"),
                                    buildListItem(context, "English"),
                                    buildListItem(context, "Punjabi"),
                                    buildListItem(context, "Tamil"),
                                    buildListItem(context, "Telugu"),
                                    buildListItem(context, "Malyalam"),
                                    buildListItem(context, "Haryanvi"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }

  Container buildListItem(BuildContext context, String text) {
    return Container(
      color: Colors.white,
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
