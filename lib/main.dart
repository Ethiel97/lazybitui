import 'package:flutter/material.dart';
import 'package:lazybitui/ui/1.dart';
import 'package:lazybitui/ui/blog_home_one.dart';
import 'package:lazybitui/ui/blog_home_two.dart';
import 'package:lazybitui/ui/dashboard_one.dart';
import 'package:lazybitui/ui/workout_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/ecommerce': (BuildContext context) => new One(),
        '/blog': (BuildContext context) => new BlogHomeOne(),
        '/blog2': (BuildContext context) => new BlogHomeTwo(),
        '/dashboard': (BuildContext context) => new DashboardOne(),
        '/workout': (BuildContext context) => new WorkoutOne(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Lazybit UI',
      home: MyHomePage(title: 'Lazybit UI Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/ecommerce');
                },
                child: Text("Ecommerce"),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/blog');
                },
                child: Text("Blog 1"),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/blog2');
                },
                child: Text("Blog 2"),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/dashboard');
                },
                child: Text("Dashboard"),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/workout');
                },
                child: Text("Workout"),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//flutter build apk --split-per-abi
