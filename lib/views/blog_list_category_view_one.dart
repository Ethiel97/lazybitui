import 'package:flutter/material.dart';

class BlogListCategoryViewOne extends StatefulWidget {
  final String image;
  final String categoryName;
  final int totalLikes;

  BlogListCategoryViewOne(
      {Key key,
      @required this.image,
      @required this.categoryName,
      this.totalLikes: 0})
      : super(key: key);

  @override
  _BlogListCategoryViewOneState createState() {
    return _BlogListCategoryViewOneState();
  }
}

class _BlogListCategoryViewOneState extends State<BlogListCategoryViewOne> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        child: Row(
          children: [
            Image(
              image: AssetImage(widget.image),
              fit: BoxFit.contain,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    widget.categoryName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "${widget.totalLikes} people marked",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
