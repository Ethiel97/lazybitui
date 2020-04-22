import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazybitui/views/blog_list_category_view_one.dart';
import 'package:lazybitui/views/blog_list_item_view_two.dart';

class BlogHomeTwo extends StatefulWidget {
  @override
  _BlogHomeTwoState createState() => _BlogHomeTwoState();
}

class _BlogHomeTwoState extends State<BlogHomeTwo> {
  List blogDetails = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      String image = "assets/blog/fashion_blog_image_one.png";
      String title = "How to run a More Effective Meeting";
      String keyword = "Business";
      if (i > 0 && i < 5) {
        if (i == 1) {
          image = "assets/blog/fashion_blog_image_two.jpg";
          keyword = "Fitness";
          title = "How I lost my weight in 10 days?";
        } else if (i == 2) {
          image = "assets/blog/fashion_blog_image_three.jpg";
          keyword = "Event";
          title =
              "Krishna and Radha's Wedding Ceremony and Reception at High Hills at Heavenly Place in India";
        } else if (i == 3) {
          image = "assets/blog/fashion_blog_image_four.jpg";
          keyword = "Latest";
          title = "Coronavirus Cure Coming Soon";
        } else if (i == 4) {
          image = "assets/blog/fashion_blog_image_five.jpeg";
          keyword = "Technology";
          title = "The dark secret of Silicon Valley";
        }
      } else if (i > 4) {
        image = "assets/blog/fashion_blog_image_six.jpg";
        title += " - " + (i + 1).toString();
        keyword += " - " + (i + 1).toString();
      }
      blogDetails.add({
        "tag": i,
        "totalLikes": (i % 3 + 5 * 2 / 2).toInt(),
        "title": title,
        "content": "How to run a More Effective Meeting - \n\n" +
            "How to run a More Effective Meeting - " +
            "How to run a More Effective Meeting - " +
            "How to run a More Effective Meeting - " +
            "How to run a More Effective Meeting - " +
            "How to run a More Effective Meeting - \n" +
            "How to run a More Effective Meeting -" +
            "How to run a More Effective Meeting - \n" +
            "How to run a More Effective Meeting - \n\n" +
            "How to run a More Effective Meeting - \n" +
            "How to run a More Effective Meeting - \n\n" +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            "How to run a More Effective Meeting - asfdfgdgfdf " +
            i.toString(),
        "timeInMinutes": 20 + i,
        "keyword": keyword,
        "image": image,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height10Percent = (MediaQuery.of(context).size.height / 100) * 30;
    double popularBlogHeight =
        MediaQuery.of(context).size.height - height10Percent;
    if (popularBlogHeight > 450) popularBlogHeight = 450;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.blur_on,
              color: Colors.black,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        elevation: 2,
        child: Container(
          color: Color(0XFFFFFFFF),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: [
                    Text(
                      'My Blog',
                      style: TextStyle(
                        color: Colors.black,
                        height: 1,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 100,
                          child: Card(
                            color: Colors.black26,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            shadowColor: Colors.black,
                            child: Image.asset(
                              "assets/blog/fashion_blog_image_two.jpg",
                              color: Colors.black54,
                              colorBlendMode: BlendMode.lighten,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                ),
              ),
              ListTile(
                title: Text(
                  'Item 1',
                  style: TextStyle(
                    color: Colors.black,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Item 2',
                  style: TextStyle(
                    color: Colors.black,
                    height: 1,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "My Blog",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      height: 1,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    height: popularBlogHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: blogDetails.length,
                      itemBuilder: (context, i) {
                        return BlogListItemViewTwo(
                            tag: blogDetails[i]["tag"],
                            keyword: blogDetails[i]["keyword"],
                            title: blogDetails[i]["title"],
                            content: blogDetails[i]["content"],
                            timeInMinutes: blogDetails[i]["timeInMinutes"],
                            totalLikes: blogDetails[i]["totalLikes"],
                            image: blogDetails[i]["image"]);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          BlogListCategoryViewOne(
                            image: "assets/blog/fashion_blog_image_six.jpg",
                            categoryName: "Test Category",
                            totalLikes: 20,
                          ),
                          BlogListCategoryViewOne(
                            image: "assets/blog/fashion_blog_image_four.jpg",
                            categoryName: "Test Category",
                            totalLikes: 20,
                          ),
                          BlogListCategoryViewOne(
                            image: "assets/blog/fashion_blog_image_three.jpg",
                            categoryName: "Test Category",
                            totalLikes: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
