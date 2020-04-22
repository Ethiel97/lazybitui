import 'package:flutter/material.dart';
import 'package:lazybitui/animations/route/slide_left_route.dart';
import 'package:lazybitui/ui/profile_one.dart';
import 'package:lazybitui/ui/shopping_cart_one.dart';
import 'package:lazybitui/utils/config.dart';

class BottomNavigationOne extends StatefulWidget {
  @override
  _BottomNavigationOne createState() => _BottomNavigationOne();
}

class _BottomNavigationOne extends State<BottomNavigationOne> {
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
          if (i == 2) {
            Navigator.of(context)
                .push(
                    MaterialPageRoute(builder: (context) => ShoppingCartOne()))
                .then((value) {
              setState(() {
                selectedBottomTab = oldSelectedBottomTab;
              });
            });
          } else if (i == 4) {
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
      backgroundColor: Config.backgroundColor,
      selectedItemColor: Config.primaryColor,
      unselectedItemColor: Config.unSelectedColor,
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
          icon: Icon(Icons.shopping_cart),
          title: Text('Cart'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.content_copy),
          title: Text('Product'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('User Account'),
        )
      ],
    );
  }
}
