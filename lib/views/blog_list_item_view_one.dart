import 'package:flutter/material.dart';
import 'package:lazybitui/ui/blog_details_one.dart';

class BlogListItemViewOne extends StatefulWidget {
  final Object tag;
  final String title;
  final String content;
  final int timeInMinutes;
  final String image;
  final String keyword;

  const BlogListItemViewOne(
      {@required this.tag,
      @required this.title,
      @required this.content,
      @required this.timeInMinutes,
      @required this.image,
      this.keyword});

  @override
  _BlogListItemViewOneState createState() => _BlogListItemViewOneState();
}

class _BlogListItemViewOneState extends State<BlogListItemViewOne> {
  @override
  Widget build(BuildContext context) {
    return _buildInfoCard(widget.tag, widget.title, widget.timeInMinutes ?? 1,
        widget.image, widget.keyword ?? "", widget.content ?? "");
  }

  Widget _buildInfoCard(Object key, String cardTitle, int timeInMinutes,
      String image, String keyword, String content) {
    return Container(
      height: 130,
      child: Card(
        elevation: 1,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlogDetailsOne(
                  tag: key,
                  image: image,
                  title: cardTitle,
                  keyword: keyword,
                  content: content,
                  timeInMinutes: timeInMinutes,
                ),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: key,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Image(
                      image: AssetImage(image),
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Chip(
                                  label: Text(
                                    keyword,
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
                                Text(
                                  cardTitle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.access_time,
                                              size: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(
                                              width: 6,
                                            ),
                                          ),
                                          TextSpan(
                                            text: timeInMinutes.toString() +
                                                "mins ago",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.comment,
                                              size: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: SizedBox(
                                              width: 6,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Comments",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
