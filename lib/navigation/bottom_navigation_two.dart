import 'package:flutter/material.dart';
import 'package:lazybitui/animations/route/slide_left_route.dart';
import 'package:lazybitui/ui/profile_one.dart';

class BottomNavigationTwo extends StatefulWidget {
  @override
  _BottomNavigationTwoState createState() => _BottomNavigationTwoState();
}

class _BottomNavigationTwoState extends State<BottomNavigationTwo> {
  int selectedTab = 0;
  int selectedBottomTab = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedBottomTab,
      onTap: (i) {
        final int oldSelectedBottomTab = selectedBottomTab;
        setState(() {
          selectedBottomTab = i;
          if (i == 4) {
            Navigator.of(context)
                .push(SlideLeftRoute(enterWidget: ProfileOne()))
                .then((value) {
              setState(() {
                selectedBottomTab = oldSelectedBottomTab;
              });
            });
          }
        });
      },
      backgroundColor: Colors.transparent,
      selectedItemColor: Color(0xFFe78f65),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text('Favourite'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.content_copy),
          title: Text('Categories'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ],
    );
  }
}
