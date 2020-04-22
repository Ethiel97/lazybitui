import 'dart:async';

import 'package:flutter/material.dart';

class BlogDetailsTwo extends StatefulWidget {
  final Object tag;
  final String title;
  final String content;
  final int timeInMinutes;
  final int totalLikes;
  final String image;
  final String keyword;

  const BlogDetailsTwo(
      {@required this.tag,
      @required this.title,
      @required this.content,
      @required this.timeInMinutes,
      @required this.image,
      @required this.totalLikes,
      this.keyword});

  @override
  _BlogDetailsTwoState createState() => _BlogDetailsTwoState();
}

class _BlogDetailsTwoState extends State<BlogDetailsTwo>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  AnimationController _animController2;
  Animation<Offset> _animOffset2;

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

    _animController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve2 =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset2 =
        Tween<Offset>(begin: const Offset(0, 0.10), end: const Offset(0, -0.35))
            .animate(curve2);

    _animController2.forward();

    Timer(Duration(milliseconds: 500), () {
      _animController.forward();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    _animController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double imageHeight = (MediaQuery.of(context).size.height / 100) * 45;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
            ),
            SlideTransition(
              position: _animOffset2,
              child: Container(
                height: null,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: widget.tag,
                  child: Center(
                    child: FadeTransition(
                      opacity: _animController2,
                      child: Image.asset(
                        widget.image,
                        height: null,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FadeTransition(
              child: SlideTransition(
                position: _animOffset,
                child: Container(
                  margin: EdgeInsets.only(left: 50, top: imageHeight - 100),
                  padding: EdgeInsets.only(left: 50, top: 20),
                  color: Colors.white,
                  child: Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        FadeTransition(
                          child: SlideTransition(
                            position: _animOffset,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ),
                          opacity: _animController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: FadeTransition(
                            child: SlideTransition(
                              position: _animOffset,
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.content,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    height: 1,
                                    fontFamily: 'Comfortaa',
                                  ),
                                ),
                              ),
                            ),
                            opacity: _animController,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              opacity: _animController,
            ),
          ],
        ),
      ),
    );
  }
}
