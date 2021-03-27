import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int bottomNavigationIndex;
  final Function setBottomNavigationIndex;

  const CustomBottomNavigation(
      {Key key, this.bottomNavigationIndex, this.setBottomNavigationIndex})
      : super(key: key);
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor:
          Theme.of(context).colorScheme.primary.withOpacity(.60),
      elevation: 4,
      onTap: (value) {
        widget.setBottomNavigationIndex(value);
      },
      currentIndex: widget.bottomNavigationIndex,
      items: [
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
          title: Text(
            'Home',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: Icon(
            Icons.home,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
          title: Text(
            'Maps',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: Icon(
            Icons.location_on_outlined,
            size: 30,
          ),
        ),
        BottomNavigationBarItem(
          // ignore: deprecated_member_use
          title: Text(
            'Payment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: Icon(
            Icons.payments,
            size: 30,
          ),
        ),
      ],
    );
  }
}
