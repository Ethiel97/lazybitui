import 'dart:ui';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LinearCount {
  final int year;
  final int count;

  LinearCount(this.year, this.count);
}

class WorkoutOne extends StatefulWidget {
  @override
  _WorkoutOneState createState() => _WorkoutOneState();
}

class _WorkoutOneState extends State<WorkoutOne> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  int selectedDate = 0;

  List dates = [
    {"day": "Sun", "date": 16},
    {"day": "Mon", "date": 17},
    {"day": "Tue", "date": 18},
    {"day": "Wed", "date": 19},
    {"day": "Thu", "date": 20},
    {"day": "Fri", "date": 21},
    {"day": "Sat", "date": 22},
    {"day": "Sun", "date": 23},
    {"day": "Mon", "date": 24},
    {"day": "Tue", "date": 25},
    {"day": "Wed", "date": 26},
    {"day": "Thu", "date": 27},
    {"day": "Fri", "date": 28},
    {"day": "Sat", "date": 29},
    {"day": "Sun", "date": 30},
    {"day": "Mon", "date": 31},
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
    List<charts.Series> seriesList = _createSampleData();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0XFF292b4d),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Mon, Feb 20, 2020",
                        style: TextStyle(
                          color: Color(0xFF989dc7),
                          fontSize: 16,
                          height: 1,
                          fontFamily: 'BalooBhaina2',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Daily Activity",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontFamily: 'BalooBhaina2',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dates.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 70,
                              width: 70,
                              child: Card(
                                color: Color(selectedDate == index
                                    ? 0xFF15d3e0
                                    : 0xFF353766),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedDate = index;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dates[index]["day"],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          height: 1,
                                          fontFamily: 'BalooBhaina2',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        dates[index]["date"].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          height: 1,
                                          fontFamily: 'BalooBhaina2',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                "Running",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                  fontFamily: 'BalooBhaina2',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.fiber_manual_record,
                              size: 8,
                              color: Color(0xFF989dc7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                "7:30 AM - 9:00 AM",
                                style: TextStyle(
                                  color: Color(0xFF989dc7),
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: 'BalooBhaina2',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: Card(
                          color: Color(0xFF353766),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              getStatusWidget(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Color(0xFF38b8cf),
                                  size: 26,
                                ),
                                title: "9.12",
                                subTitle: "Kilometers",
                              ),
                              getStatusWidget(
                                icon: Icon(
                                  Icons.access_time,
                                  color: Color(0xFF75b564),
                                  size: 26,
                                ),
                                title: "1.30",
                                subTitle: "Hours",
                              ),
                              getStatusWidget(
                                icon: Icon(
                                  FlutterIcons.shoe_print_mco,
                                  color: Color(0xFFd47176),
                                  size: 26,
                                ),
                                title: "5.25",
                                subTitle: "Speed",
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                "Gym",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                  fontFamily: 'BalooBhaina2',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.fiber_manual_record,
                              size: 8,
                              color: Color(0xFF989dc7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                "1:30 PM - 2:45 PM",
                                style: TextStyle(
                                  color: Color(0xFF989dc7),
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: 'BalooBhaina2',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Card(
                                  color: Color(0xFF353766),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.redAccent,
                                              size: 26,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "88",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1,
                                                    fontFamily: 'BalooBhaina2',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "bpm",
                                                  style: TextStyle(
                                                    color: Color(0xFF989dc7),
                                                    fontSize: 14,
                                                    height: 1,
                                                    fontFamily: 'BalooBhaina2',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 75,
                                          child: new charts.LineChart(
                                            seriesList,
                                            animate: true,
                                            domainAxis:
                                                new charts.NumericAxisSpec(
                                              showAxisLine: false,
                                              renderSpec:
                                                  new charts.NoneRenderSpec(),
                                            ),
                                            primaryMeasureAxis:
                                                new charts.NumericAxisSpec(
                                              renderSpec:
                                                  new charts.NoneRenderSpec(),
                                              showAxisLine: false,
                                            ),
                                            secondaryMeasureAxis:
                                                new charts.NumericAxisSpec(
                                              renderSpec:
                                                  new charts.NoneRenderSpec(),
                                              showAxisLine: false,
                                            ),
                                            defaultRenderer:
                                                new charts.LineRendererConfig(
                                                    includePoints: false,
                                                    includeArea: false),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        color: Color(0xFF353766),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "450",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1,
                                                        fontFamily:
                                                            'BalooBhaina2',
                                                      ),
                                                    ),
                                                    Text(
                                                      "steps",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF989dc7),
                                                        fontSize: 14,
                                                        height: 1,
                                                        fontFamily:
                                                            'BalooBhaina2',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Icon(
                                                  FlutterIcons.bar_chart_fea,
                                                  color: Colors.lightGreen,
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Card(
                                        color: Color(0xFF353766),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "325",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1,
                                                        fontFamily:
                                                            'BalooBhaina2',
                                                      ),
                                                    ),
                                                    Text(
                                                      "Calories",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF989dc7),
                                                        fontSize: 14,
                                                        height: 1,
                                                        fontFamily:
                                                            'BalooBhaina2',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Icon(
                                                  FlutterIcons.chart_arc_mco,
                                                  color: Color(0xFF15d3e0),
                                                  size: 30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<LinearCount, int>> _createSampleData() {
    final data = [
      new LinearCount(0, 5),
      new LinearCount(1, 10),
      new LinearCount(2, 15),
      new LinearCount(3, 20),
      new LinearCount(4, 25),
      new LinearCount(5, 25),
      new LinearCount(6, 40),
      new LinearCount(7, 55),
      new LinearCount(8, 75),
      new LinearCount(9, 80),
      new LinearCount(10, 84),
      new LinearCount(11, 87),
      new LinearCount(12, 90),
      new LinearCount(13, 93),
      new LinearCount(14, 95),
      new LinearCount(15, 100),
    ];

    return [
      new charts.Series<LinearCount, int>(
        id: 'Counts',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearCount counts, _) => counts.year,
        measureFn: (LinearCount counts, _) => counts.count,
        data: data,
      )
    ];
  }

  Widget getStatusWidget({Icon icon, String title, String subTitle}) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1,
                fontFamily: 'BalooBhaina2',
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Color(0xFF989dc7),
                fontSize: 14,
                height: 1,
                fontFamily: 'BalooBhaina2',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
