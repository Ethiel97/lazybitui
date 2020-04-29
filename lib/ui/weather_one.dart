import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WeatherOne extends StatefulWidget {
  @override
  _WeatherOneState createState() => _WeatherOneState();
}

class _WeatherOneState extends State<WeatherOne> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool isDarkMode = true;
  Color backgroundColor = Color(0XFFFFFFFF);
  Color primaryColor = Color(0XFF1f2542);
  Color secondaryColor = Color(0XFFb7b7b7);
  Color accentColor = Color(0XFFff2e60);

  List weatherIconDataList = [];
  int currentWeather = 0;

  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    /*Timer(Duration(milliseconds: 500), () {
      _animController.forward();
    });*/
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    weatherIconDataList = [
      {
        "day": "Friday",
        "icon": Icon(
          FlutterIcons.weather_sunny_mco,
          color: accentColor.withAlpha(90),
          size: 30,
        ),
        "iconData": FlutterIcons.weather_sunny_mco,
        "temperature": 29,
        "weatherType": "Sunny",
        "windSpeed": 90,
        "humidity": 42,
        "minTemperature": 21,
        "maxTemperature": 29,
      },
      {
        "day": "Saturday",
        "icon": Icon(
          FlutterIcons.weather_partly_cloudy_mco,
          color: accentColor.withAlpha(90),
          size: 30,
        ),
        "iconData": FlutterIcons.weather_partly_cloudy_mco,
        "temperature": 25,
        "weatherType": "Partly Cloudy",
        "windSpeed": 66,
        "humidity": 39,
        "minTemperature": 20,
        "maxTemperature": 27,
      },
      {
        "day": "Sunday",
        "icon": Icon(
          FlutterIcons.weather_partly_cloudy_mco,
          color: accentColor.withAlpha(90),
          size: 30,
        ),
        "iconData": FlutterIcons.weather_partly_cloudy_mco,
        "temperature": 26,
        "weatherType": "Partly Cloudy",
        "windSpeed": 56,
        "humidity": 65,
        "minTemperature": 20,
        "maxTemperature": 29,
      },
      {
        "day": "Monday",
        "icon": Icon(
          FlutterIcons.weather_cloudy_mco,
          color: accentColor.withAlpha(90),
          size: 30,
        ),
        "iconData": FlutterIcons.weather_cloudy_mco,
        "temperature": 24,
        "weatherType": "Cloudy",
        "windSpeed": 87,
        "humidity": 76,
        "minTemperature": 22,
        "maxTemperature": 27,
      },
    ];

    if (isDarkMode) {
      backgroundColor = Color(0XFF000000);
      primaryColor = Color(0XFFFFFFFF);
      secondaryColor = Color(0XFFEEEEEE);
      accentColor = Color(0XFFff2e60);
    } else {
      backgroundColor = Color(0XFFFFFFFF);
      primaryColor = Color(0XFF1f2542);
      secondaryColor = Color(0XFFb7b7b7);
      accentColor = Color(0XFFff2e60);
    }

    var currentWeatherData = weatherIconDataList[currentWeather];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Bangalore",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                          "Today's Weather",
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.wb_sunny : FlutterIcons.moon_full_mco,
                      color: primaryColor,
                    ),
                    tooltip: "Switch to ${isDarkMode ? "Light" : "Dark"} Mode",
                    onPressed: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                    },
                  ),
                ],
              ),
              Container(
                height: 70,
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getWeatherIconDataWidgets(),
                ),
              ),
              Expanded(
                child: FadeTransition(
                  opacity: _animController,
                  child: SlideTransition(
                    position: _animOffset,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentWeatherData["day"],
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            currentWeatherData["iconData"],
                            color: accentColor,
                            size: 200,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${currentWeatherData["temperature"]}°",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            currentWeatherData["weatherType"],
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getBottomWidget(
                      title: "${currentWeatherData["minTemperature"]}°",
                      subTitle: "Min"),
                  getBottomWidget(
                      title: "${currentWeatherData["maxTemperature"]}°",
                      subTitle: "Max"),
                  getBottomWidget(
                      title: "${currentWeatherData["windSpeed"]}km/h",
                      subTitle: "Wind Speed"),
                  getBottomWidget(
                      title: "${currentWeatherData["humidity"]}%",
                      subTitle: "Humidity"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getWeatherIconDataWidgets() {
    List<Widget> result = [];

    for (var i = 0; i < weatherIconDataList.length; i++) {
      var d = weatherIconDataList[i];
      result.add(
        getWeatherIconData(
          currentIndex: i,
          day: d["day"],
          icon: d["icon"],
          temperature: d["temperature"],
        ),
      );
    }

    return result;
  }

  Widget getWeatherIconData(
      {@required currentIndex,
      @required String day,
      @required Icon icon,
      @required num temperature}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentWeather = currentIndex;
          _animController.reset();
          _animController.forward();
        });
      },
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          icon,
          Text(
            '$temperature°',
            style: TextStyle(
              color: primaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottomWidget({@required String title, @required String subTitle}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: secondaryColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
