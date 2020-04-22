import 'package:flutter/material.dart';
import 'package:lazybitui/animations/route/slide_left_route.dart';
import 'package:lazybitui/navigation/bottom_navigation_one.dart';
import 'package:lazybitui/navigation/tab_navigation_one.dart';
import 'package:lazybitui/ui/product_grid_one.dart';
import 'package:lazybitui/views/search_view_one.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.apps,
          color: Color(0xFF808080),
        ),
        title: Center(
          child: Text(
            "LAZYBIT",
            style: TextStyle(
                color: Color(0xFF808080), fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(SlideLeftRoute(enterWidget: SearchViewOne()));
              },
              child: Icon(
                Icons.search,
                color: Color(0xFF808080),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationOne(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
              height: 40.0,
              margin: EdgeInsets.only(bottom: 5),
              child: TabNavigationOne()),
          Expanded(
            flex: 1,
            child: ProductGridOne(),
          )
        ],
      ),
    );
  }
}
