import 'package:flutter/material.dart';
import 'package:lazybitui/ui/shopping_cart_one.dart';
import 'package:lazybitui/utils/config.dart';

class ProductDetailsPageOne extends StatefulWidget {
  final Object heroTag;
  final String image;
  final String title;
  final String description;
  final double price;

  ProductDetailsPageOne(
      {this.heroTag, this.image, this.description, this.title, this.price});

  @override
  _ProductDetailsPageOne createState() => _ProductDetailsPageOne();
}

class _ProductDetailsPageOne extends State<ProductDetailsPageOne> {
  int selectedCardKey = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Config.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Item Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.title,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Text(widget.description ?? "",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18.0,
                            color: Colors.grey.withOpacity(0.3),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Rs." + (widget.price.toStringAsFixed(2)),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: Config.primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Config.primaryColor),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text('2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0)),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Config.primaryColor,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                        height: 100.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard(0, 'Size', '', 'S'),
                            SizedBox(width: 10.0),
                            _buildInfoCard(1, 'Size', '', 'M'),
                            SizedBox(width: 10.0),
                            _buildInfoCard(2, 'Size', '', 'L'),
                            SizedBox(width: 10.0),
                            _buildInfoCard(3, 'Size', '', 'XL'),
                          ],
                        )),
                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.all(5),
                          child: ClipOval(
                            child: Material(
                              color: Config.primaryColor,
                              child: InkWell(
                                splashColor: Config.primarySplashColor,
                                child: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 14,
                                    color: Config.secondaryColor,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ShoppingCartOne()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: Config.gradientColor),
                                  ),
                                  height: 50.0,
                                  child: Center(
                                    child: Text("Buy",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat')),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ])
        ]));
  }

  Widget _buildInfoCard(int key, String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        selectCard(key);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: key == selectedCardKey ? Config.primaryColor : Colors.white,
          border: Border.all(
              color: key == selectedCardKey
                  ? Colors.transparent
                  : Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75),
        ),
        height: 20.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                cardTitle,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.0,
                  color: key == selectedCardKey
                      ? Colors.white
                      : Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: key == selectedCardKey
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    unit,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.0,
                      color:
                          key == selectedCardKey ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectCard(int key) {
    setState(() {
      selectedCardKey = key;
    });
  }
}
