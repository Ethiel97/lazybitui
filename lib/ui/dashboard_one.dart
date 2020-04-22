import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashboardOne extends StatefulWidget {
  @override
  _DashboardOneState createState() => _DashboardOneState();
}

class _DashboardOneState extends State<DashboardOne> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  int selectedListNumber = 7;
  List<String> numberListData = [
    "12",
    "213",
    "4",
    "2",
    "54",
    "78",
    "34",
    "12",
    "7",
    "23",
    "34",
    "12",
    "435",
    "45",
    "45",
    "12",
    "213",
    "4",
    "2",
    "54",
    "78",
    "34",
    "12",
    "7",
    "23",
    "34",
    "12",
    "435",
    "45",
    "45",
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0XFF070A19),
      drawer: Drawer(
        child: Container(
          color: Color(0XFF070A19),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0XFF1f2230),
                ),
              ),
              ListTile(
                title: Text(
                  'Item 1',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Item 2',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  }),
              elevation: 0.0,
              title: null,
              actions: [
                IconButton(
                    icon: Icon(Icons.add_circle_outline), onPressed: () {})
              ],
              expandedHeight: 380.0,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                centerTitle: true,
                background: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: getDashboardWidget(
                            topColor: Color(0xFF7584ff),
                            bottomColor: Color(0xFF6967ff),
                            icon: Icons.group,
                            largeText: "437",
                            smallText: "Total",
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: getDashboardWidget(
                            topColor: Color(0xFF579ff8),
                            bottomColor: Color(0xFF418cf7),
                            icon: Icons.person_add,
                            largeText: "239",
                            smallText: "New",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: getDashboardWidget(
                            topColor: Color(0xFFf06291),
                            bottomColor: Color(0xFFe35a88),
                            icon: Icons.person_outline,
                            largeText: numberListData[selectedListNumber],
                            smallText: "Lost",
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: getDashboardWidget(
                            topColor: Color(0xFF4b567e),
                            bottomColor: Color(0xFF344061),
                            icon: Icons.attach_money,
                            largeText: "400.67",
                            smallText: "Earning",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: numberListData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getHorizontalNumberWidget(
                          index: index, text: numberListData[index]);
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Payment History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(
                          Icons.blur_on,
                          color: Colors.white,
                        ),
                        onPressed: () {})
                  ],
                ),
                Expanded(
                  child: Container(
                      child: Stack(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.only(bottom: 100),
                        itemCount: 30,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFF6967ff).withAlpha(80),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                        color: Color(0xFF5e6a8b),
                                        fontSize: 14,
                                        height: 1,
                                        fontFamily: 'Comfortaa',
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      "Amount",
                                      style: TextStyle(
                                        color: Color(0xFF5e6a8b),
                                        fontSize: 14,
                                        height: 1,
                                        fontFamily: 'Comfortaa',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      "Status",
                                      style: TextStyle(
                                        color: Color(0xFF5e6a8b),
                                        fontSize: 14,
                                        height: 1,
                                        fontFamily: 'Comfortaa',
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return getPaymentRow(
                                date: "0" +
                                    ((index % 9).toInt() > 0
                                            ? (index % 9).toInt()
                                            : 1)
                                        .toString() +
                                    ".0" +
                                    ((index % 9).toInt() > 0
                                            ? (index % 9).toInt()
                                            : 1)
                                        .toString() +
                                    ".19",
                                amount: 2.34 * index % 3,
                                status: index % 3 == 1 ? 1 : 0);
                          }
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          color: Color(0XA0070A19),
                          height: 70,
                          width: MediaQuery.of(context).size.width - 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.print,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getPaymentRow({String date, double amount, int status: 0}) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                child: Text(
                  date,
                  style: TextStyle(
                    color: Color(0xFF5e6a8b),
                    fontSize: 14,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  "\$ ${amount.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0xFF5e6a8b),
                    fontSize: 14,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  status == 0 ? "Pending" : "Paid",
                  style: TextStyle(
                    color: Color(status == 0 ? 0xFF647ec6 : 0xFF60a6cb),
                    fontSize: 14,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ));
  }

  Widget getHorizontalNumberWidget({int index: 0, String text}) {
    int type = selectedListNumber == index ? 1 : 0;
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedListNumber = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            text,
            style: TextStyle(
              color: Color(type == 0 ? 0xFF505d80 : 0xFFc9cfde),
              height: 1,
              fontFamily: 'Comfortaa',
            ),
          ),
        ),
      ),
    );
  }

  Widget getDashboardWidget(
      {Color topColor,
      Color bottomColor,
      IconData icon,
      String largeText,
      String smallText}) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.transparent,
        shadowColor: topColor,
        elevation: 7,
        child: Container(
          height: 150,
          width: 150,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: topColor.withAlpha(60),
                  blurRadius: 6.0,
                  spreadRadius: 4.0,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [topColor, bottomColor])),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: IconButton(icon: Icon(icon), onPressed: () {}),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    largeText,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1,
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    smallText,
                    style: TextStyle(
                      height: 1,
                      fontSize: 12,
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
