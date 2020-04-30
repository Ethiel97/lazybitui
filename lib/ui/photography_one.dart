import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class PhotographyOne extends StatefulWidget {
  @override
  _PhotographyOneState createState() => _PhotographyOneState();
}

class _PhotographyOneState extends State<PhotographyOne>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool isDarkMode = true;
  Color backgroundColor = Color(0XFF000000);
  Color primaryColor = Color(0XFFFFFFFF);
  String backgroundImage = "";

  int selectedIndex = 0;
  num listHeight = 0;
  bool clickedHandler = false;
  bool showDetails = false;
  bool firstLoadDone = false;

  AnimationController _animController;
  AnimationController _showDetailsAnimController;
  AnimationController _showDetailsHideListAnimController;
  AnimationController _fadeOutAnimController;
  AnimationController _listAnimController;
  AnimationController _detailsAnimController;
  Animation<Offset> _animOffset;
  Animation<Offset> _showDetailsAnimOffset;
  Animation<Offset> _showDetailsHideListAnimOffset;
  Animation<Offset> _animOffsetFromTop;
  Animation<double> _detailsAnimTween;
  var detailsHideListCurve;

  static String longDescription =
      "He sat staring at the person in the train stopped at the station going in the opposite direction. She sat staring ahead, never noticing that she was being watched. Both trains began to move and he knew that in another timeline or in another universe, they had been happy together.\nAll he could think about was how it would all end. There was still a bit of uncertainty in the equation, but the basics were there for anyone to see. No matter how much he tried to see the positive, it wasn't anywhere to be seen. The end was coming and it wasn't going to be pretty.\nThe wolves stopped in their tracks, sizing up the mother and her cubs. It had been over a week since their last meal and they were getting desperate. The cubs would make a good meal, but there were high risks taking on the mother Grizzly. A decision had to be made and the wrong choice could signal the end of the pack.\nShe tried to explain that love wasn't like pie. There wasn't a set number of slices to be given out. There wasn't less to be given to one person if you wanted to give more to another. That after a set amount was given out it would all disappear. She tried to explain this, but it fell on deaf ears.\nShe had come to the conclusion that you could tell a lot about a person by their ears. The way they stuck out and the size of the earlobes could give you wonderful insights into the person. Of course, she couldn't scientifically prove any of this, but that didn't matter to her. Before anything else, she would size up the ears of the person she was talking to.\nThis is important to remember. Love isn't like pie. You don't need to divide it among all your friends and loved ones. No matter how much love you give, you can always give more. It doesn't run out, so don't try to hold back giving it as if it may one day run out. Give it freely and as much as you want.\nHe was an expert but not in a discipline that anyone could fully appreciate. He knew how to hold the cone just right so that the soft server ice-cream fell into it at the precise angle to form a perfect cone each and every time. It had taken years to perfect and he could now do it without even putting any thought behind it. Nobody seemed to fully understand the beauty of this accomplishment except for the new worker who watched in amazement.\nIndescribable oppression, which seemed to generate in some unfamiliar part of her consciousness, filled her whole being with a vague anguish. It was like a shadow, like a mist passing across her soul's summer day. It was strange and unfamiliar; it was a mood. She did not sit there inwardly upbraiding her husband, lamenting at Fate, which had directed her footsteps to the path which they had taken. She was just having a good cry all to herself. The mosquitoes made merry over her, biting her firm, round arms and nipping at her bare insteps.\nAt that moment he had a thought that he'd never imagine he'd consider. 'I could just cheat,' he thought, 'and that would solve the problem.' He tried to move on from the thought but it was persistent. It didn't want to go away and, if he was honest with himself, he didn't want it to.\nHe couldn't move. His head throbbed and spun. He couldn't decide if it was the flu or the drinking last night. It was probably a combination of both.\nPink ponies and purple giraffes roamed the field. Cotton candy grew from the ground as a chocolate river meandered off to the side. What looked like stones in the pasture were actually rock candy. Everything in her dream seemed to be perfect except for the fact that she had no mouth.\nEating raw fish didn't sound like a good idea. 'It's a delicacy in Japan,' didn't seem to make it any more appetizing. Raw fish is raw fish, delicacy or not.\nShe sat in the darkened room waiting. It was now a standoff. He had the power to put her in the room, but not the power to make her repent. It wasn't fair and no matter how long she had to endure the darkness, she wouldn't change her attitude. At three years old, Sandy's stubborn personality had already bloomed into full view.\nGreen vines attached to the trunk of the tree had wound themselves toward the top of the canopy. Ants used the vine as their private highway, avoiding all the creases and crags of the bark, to freely move at top speed from top to bottom or bottom to top depending on their current chore. At least this was the way it was supposed to be. Something had damaged the vine overnight halfway up the tree leaving a gap in the once pristine ant highway.\nHe wondered if he should disclose the truth to his friends. It would be a risky move. Yes, the truth would make things a lot easier if they all stayed on the same page, but the truth might fracture the group leaving everything in even more of a mess than it was not telling the truth. It was time to decide which way to go.";

  List mainList = [
    {
      "title": "Photography 1",
      "description": longDescription,
      "date": "2nd May 2020",
      "image": "assets/photography/photography_2.jpg",
      "author": "Lucky",
      "location": "Bangalore",
      "tag": "Child Photography",
    },
    {
      "title": "Photography 2",
      "description": longDescription,
      "date": "22nd April 2020",
      "image": "assets/photography/photography_5.jpg",
      "author": "Lucky",
      "location": "Bangalore",
      "tag": "Simplicity",
    },
    {
      "title": "Photography 3",
      "description": "Hello World 3",
      "date": "3rd May 2020",
      "image": "assets/photography/photography_3.jpeg",
      "author": "Lucky",
      "location": "Bangalore",
      "tag": "Life",
    },
    {
      "title": "Photography 4",
      "description": "Hello World 4",
      "date": "2nd Jan 2020",
      "image": "assets/photography/photography_4.jpg",
      "author": "Lucky",
      "location": "Bangalore",
      "tag": "Blog",
    },
    {
      "title": "Photography 5",
      "description": "Hello World",
      "date": "2nd Feb 2020",
      "image": "assets/photography/photography_0.jpg",
      "author": "Lucky",
      "location": "Bangalore",
      "tag": "Test",
    },
  ];

  @override
  void dispose() {
    _detailsAnimController.dispose();
    _showDetailsAnimController.dispose();
    _showDetailsHideListAnimController.dispose();
    _fadeOutAnimController.dispose();
    _animController.dispose();
    _listAnimController.dispose();
    super.dispose();
  }

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
    _animOffsetFromTop =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    _animController.forward();

    //List Animation Controller
    _listAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _listAnimController.forward();

    //Fade Out Animation Controller
    _fadeOutAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    //Show Details Animation Controller
    _showDetailsAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    final showDetailsCurve = CurvedAnimation(
        curve: Curves.easeOut, parent: _showDetailsAnimController);

    _showDetailsAnimOffset =
        Tween<Offset>(begin: const Offset(0.0, -0.35), end: Offset.zero)
            .animate(showDetailsCurve);

    //Show Details Hide List Animation Controller
    _showDetailsHideListAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    final showDetailsHideListCurve = CurvedAnimation(
        curve: Curves.easeOut, parent: _showDetailsHideListAnimController);

    _showDetailsHideListAnimOffset =
        Tween<Offset>(begin: Offset(-1.0, 0.35), end: Offset.zero)
            .animate(showDetailsHideListCurve);

    //Details Animation Controller
    _detailsAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _detailsAnimTween =
        Tween<double>(begin: 1, end: 0).animate(_detailsAnimController);
  }

  @override
  Widget build(BuildContext context) {
    var d = mainList[selectedIndex];
    backgroundImage = d["image"];

    num height = MediaQuery.of(context).size.height;
    num width = MediaQuery.of(context).size.width;
    listHeight = (MediaQuery.of(context).size.height / 100) * 40;

    if (showDetails) {
      _fadeOutAnimController.reverse();
      _showDetailsAnimController.reverse();
      _showDetailsHideListAnimController.reverse();
      _detailsAnimController.reverse();
      Timer(Duration(milliseconds: 1000), () {
        _fadeOutAnimController.reset();
        _showDetailsAnimController.reset();
        _showDetailsHideListAnimController.reset();
        _detailsAnimController.reset();
      });
    } else {
      _fadeOutAnimController.forward();
      _showDetailsAnimController.forward();
      _showDetailsHideListAnimController.forward();
      _detailsAnimController.forward();
    }

    Widget result = Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: Drawer(
            child: Container(
              color: backgroundColor.withOpacity(0.3),
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
                      color: Colors.grey.withOpacity(0.2),
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
          )),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              showDetails || firstLoadDone
                  ? Positioned.fill(
                      top: listHeight - 50,
                      bottom: 20,
                      child: FadeTransition(
                        opacity: _detailsAnimTween,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.white.withOpacity(0.6),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: SingleChildScrollView(
                              child: Text(
                                d["description"],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: 'Comfortaa',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: FadeTransition(
                        opacity: _fadeOutAnimController,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Photography",
                              style: TextStyle(
                                color: primaryColor.withAlpha(60),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              color: primaryColor.withAlpha(60),
                              onPressed: () {
                                _scaffoldKey.currentState.openEndDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SlideTransition(
                        position: _showDetailsAnimOffset,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeTransition(
                                opacity: _animController,
                                child: SlideTransition(
                                  position: _animOffsetFromTop,
                                  child: Container(
                                    height: 40.0,
                                    padding: EdgeInsets.all(10),
                                    decoration: new BoxDecoration(
                                      color: Colors.grey.shade200.withAlpha(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        d["tag"].toString().toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeTransition(
                                opacity: _animController,
                                child: Center(
                                  child: Text(
                                    d["title"].toString().toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 50,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeTransition(
                                opacity: _animController,
                                child: SlideTransition(
                                  position: _animOffset,
                                  child: Center(
                                    child: Text(
                                      d["date"].toString().toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FadeTransition(
                                opacity: _animController,
                                child: SlideTransition(
                                  position: _animOffset,
                                  child: FloatingActionButton(
                                    mini: showDetails,
                                    backgroundColor:
                                        Colors.grey.shade200.withAlpha(80),
                                    onPressed: () {
                                      setState(() {
                                        showDetails = !showDetails;
                                      });
                                    },
                                    child: Icon(
                                      showDetails
                                          ? Icons.close
                                          : Icons.navigate_next,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _listAnimController,
                      child: SlideTransition(
                        position: _showDetailsHideListAnimOffset,
                        child: Container(
                          height: listHeight,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: mainList.length,
                            itemBuilder: (c, i) {
                              var d = mainList[i];
                              return getListItem(
                                currentIndex: i,
                                image: d["image"],
                                title: d["title"],
                                date: d["date"],
                              );
                            },
                          ),
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
    );

    if (!firstLoadDone) firstLoadDone = true;

    return result;
  }

  Widget getListItem(
      {@required int currentIndex,
      @required String image,
      @required String title,
      @required String date}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          if (clickedHandler) return;
          if (selectedIndex != currentIndex) {
            clickedHandler = true;
            _listAnimController.reverse();
            _animController.reverse();
            Timer(Duration(milliseconds: 1000), () {
              setState(() {
                selectedIndex = currentIndex;
                _animController.reset();
                _animController.forward();
                _listAnimController.reset();
                _listAnimController.forward();
                Timer(Duration(milliseconds: 1000), () {
                  clickedHandler = false;
                });
              });
            });
          }
        },
        child: Column(
          children: [
            Hero(
              tag: image,
              child: Image.asset(
                image,
                height: listHeight - 100,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: primaryColor.withAlpha(80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
