import 'package:flutter/material.dart';
import 'package:lazybitui/ui/blog_details_two.dart';

class BlogListItemViewTwo extends StatefulWidget {
  final Object tag;
  final String title;
  final String content;
  final int timeInMinutes;
  final int totalLikes;
  final String image;
  final String keyword;

  const BlogListItemViewTwo(
      {@required this.tag,
      @required this.title,
      @required this.content,
      @required this.timeInMinutes,
      @required this.image,
      @required this.totalLikes,
      this.keyword});

  @override
  _BlogListItemViewTwoState createState() => _BlogListItemViewTwoState();
}

class _BlogListItemViewTwoState extends State<BlogListItemViewTwo> {
  @override
  Widget build(BuildContext context) {
    return _buildInfoCard(
        widget.tag,
        widget.title,
        widget.timeInMinutes ?? 1,
        widget.image ?? "",
        widget.keyword ?? "",
        widget.content ?? "",
        widget.totalLikes ?? 0);
  }

  Widget _buildInfoCard(Object key, String cardTitle, int timeInMinutes,
      String imageUrl, String keyword, String content, int totalLikes) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 150,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: Colors.black26,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                child: Text(
                  "$totalLikes people Likes",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: InkWell(
                onTap: () {
                  navigateToNext();
                },
                child: Hero(
                  tag: key,
                  child: Center(
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment(-.2, 0),
                            image: AssetImage(imageUrl)),
                      ),
                      child: Text(""),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(5),
                child: IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      navigateToNext();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigateToNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlogDetailsTwo(
          tag: widget.tag,
          image: widget.image,
          title: widget.title,
          keyword: widget.keyword,
          content: widget.content,
          totalLikes: widget.totalLikes,
          timeInMinutes: widget.timeInMinutes,
        ),
      ),
    );
  }
}
