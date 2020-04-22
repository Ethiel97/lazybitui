import 'package:flutter/material.dart';
import 'package:lazybitui/utils/config.dart';

class ProfileTabNavigationOne extends StatefulWidget {
  final TabController tabController;

  const ProfileTabNavigationOne({Key key, this.tabController})
      : super(key: key);

  @override
  _TabNavigationOne createState() => _TabNavigationOne();
}

class _TabNavigationOne extends State<ProfileTabNavigationOne> {
  int selectedTab = 0;

  List<String> tabMenuItems = [
    "Profile",
    "Shipping Address",
    "Change Password"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: TabBar(
          controller: widget.tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Config.primaryColor),
              insets: EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
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
          ],
        ));
  }
}
