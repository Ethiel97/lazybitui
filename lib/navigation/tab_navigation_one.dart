import 'package:flutter/material.dart';
import 'package:lazybitui/utils/config.dart';

class TabNavigationOne extends StatefulWidget {
  @override
  _TabNavigationOne createState() => _TabNavigationOne();
}

class _TabNavigationOne extends State<TabNavigationOne> {
  int selectedTab = 0;

  List<String> tabMenuItems = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
    "Category 7",
    "Category 8",
    "Category 9",
    "Category 10"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: TabBar(
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Config.primaryColor),
              insets: EdgeInsets.symmetric(horizontal: 40.0)),
          labelStyle: TextStyle(fontSize: 16),
          isScrollable: true,
          indicatorColor: Config.primaryColor,
          labelColor: Config.primaryColor,
          unselectedLabelColor: Config.unSelectedColor,
          tabs: <Widget>[
            Text(
              tabMenuItems[0],
            ),
            Text(
              tabMenuItems[1],
            ),
            Text(
              tabMenuItems[2],
            ),
            Text(
              tabMenuItems[3],
            ),
            Text(
              tabMenuItems[4],
            ),
            Text(
              tabMenuItems[5],
            ),
            Text(
              tabMenuItems[6],
            ),
          ],
        ));
  }
}
