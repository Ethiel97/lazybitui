import 'package:flutter/material.dart';
import 'package:lazybitui/ui/shopping_cart_list_one.dart';
import 'package:lazybitui/utils/config.dart';

class ShoppingCartOne extends StatefulWidget {
  @override
  _ShoppingCartOne createState() => _ShoppingCartOne();
}

class _ShoppingCartOne extends State<ShoppingCartOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            "Shopping Cart",
            style: TextStyle(
                fontSize: 16,
                color: Color(0xFF5F5F5F),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          titleSpacing: 10,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ShoppingCartListOne(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Subtotal",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFC7CFCF),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Rs.1,00,000",
            style: TextStyle(
                fontSize: 20,
                color: Config.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: 0.2,
              valueColor:
                  new AlwaysStoppedAnimation<Color>(Config.primaryColor),
              backgroundColor: Config.primarySplashColor,
            ),
          ),
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
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: Config.gradientColor),
                        ),
                        height: 50.0,
                        child: Center(
                          child: Text("Place this order",
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
          )
        ],
      ),
    );
  }
}
