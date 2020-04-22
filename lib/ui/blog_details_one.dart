import 'package:flutter/material.dart';

class BlogDetailsOne extends StatefulWidget {
  final Object tag;
  final String title;
  final String content;
  final int timeInMinutes;
  final String image;
  final String keyword;

  const BlogDetailsOne(
      {@required this.tag,
      @required this.title,
      @required this.content,
      @required this.timeInMinutes,
      @required this.image,
      this.keyword});

  @override
  _BlogDetailsOneState createState() => _BlogDetailsOneState();
}

class _BlogDetailsOneState extends State<BlogDetailsOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF808080),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8),
            child: DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              icon: Icon(
                Icons.more_horiz,
                color: Color(0xFF808080),
              ),
              underline: Container(),
              elevation: 0,
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.keyword ?? "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  padding: EdgeInsets.all(0),
                  backgroundColor: Color(0xFF503e9d),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 6,
                        ),
                      ),
                      TextSpan(
                        text:
                            (widget.timeInMinutes ?? 1).toString() + "mins ago",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              widget.title ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: widget.tag,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
//                  color: Colors.grey.withOpacity(0.3),
                  ),
                  height: 170,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Image(
                    image: AssetImage(widget.image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Text(
                    widget.content ?? "",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
