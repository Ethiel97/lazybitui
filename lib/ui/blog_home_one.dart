import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazybitui/navigation/bottom_navigation_two.dart';
import 'package:lazybitui/ui/blog_details_one.dart';
import 'package:lazybitui/views/blog_list_item_view_one.dart';

class BlogHomeOne extends StatefulWidget {
  @override
  _BlogHomeOneState createState() => _BlogHomeOneState();
}

class _BlogHomeOneState extends State<BlogHomeOne> {
  List blogDetails = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      String image = "assets/cartoon/cartoon_1.png";
      String title = "How to run a More Effective Meeting";
      String keyword = "Business";
      if (i > 0 && i < 5) {
        image = "assets/person/person_$i.png";
        if (i == 1) {
          keyword = "Fitness";
          title = "How I lost my weight in 10 days?";
        } else if (i == 2) {
          keyword = "Event";
          title =
              "Krishna and Radha's Wedding Ceremony and Reception at High Hills at Heavenly Place in India";
        } else if (i == 3) {
          keyword = "Latest";
          title = "Coronavirus Cure Coming Soon";
        } else if (i == 4) {
          keyword = "Technology";
          title = "The dark secret of Silicon Valley";
        }
      } else if (i > 4) {
        title += " - " + (i + 1).toString();
        keyword += " - " + (i + 1).toString();
      }
      blogDetails.add({
        "tag": i,
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 30,
              child: InkWell(
                  child: Image(
                    alignment: Alignment.centerLeft,
                    image: AssetImage('assets/person/person_1.png'),
                  ),
                  onTap: () {}),
            ),
          ],
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
      bottomNavigationBar: BottomNavigationTwo(),
      body: Container(
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlogDetailsOne(
                        tag: blogDetails[0]["tag"],
                        keyword: blogDetails[0]["keyword"],
                        title: blogDetails[0]["title"],
                        content: blogDetails[0]["content"],
                        timeInMinutes: blogDetails[0]["timeInMinutes"],
                        image: blogDetails[0]["image"]),
                  ),
                );
              },
              child: Column(
                children: [
                  Center(
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
                        image: AssetImage('assets/cartoon/cartoon_1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "How to run a More Effective Meeting",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
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
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 6,
                                ),
                              ),
                              TextSpan(
                                text: "50mins ago",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.withOpacity(0.7),
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
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 6,
                                ),
                              ),
                              TextSpan(
                                text: "99 Comments",
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Show all",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFFe78f65),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: blogDetails.length,
                          itemBuilder: (context, i) {
                            return BlogListItemViewOne(
                                tag: blogDetails[i]["tag"],
                                keyword: blogDetails[i]["keyword"],
                                title: blogDetails[i]["title"],
                                content: blogDetails[i]["content"],
                                timeInMinutes: blogDetails[i]["timeInMinutes"],
                                image: blogDetails[i]["image"]);
                          },
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
    );
  }
}
