import 'package:flutter/material.dart';
import 'package:lazybitui/utils/config.dart';

class ShoppingCartItemViewOne extends StatefulWidget {
  final Object tag;
  final String title;
  final String description;
  final String color;
  final String size;
  final double qty;
  final String image;
  final double amount;

  const ShoppingCartItemViewOne(
      {@required this.tag,
      @required this.title,
      this.description,
      @required this.image,
      this.color,
      this.size,
      this.qty,
      @required this.amount});

  @override
  _ShoppingCartItemViewOne createState() => _ShoppingCartItemViewOne();
}

class _ShoppingCartItemViewOne extends State<ShoppingCartItemViewOne> {
  @override
  Widget build(BuildContext context) {
    return _buildInfoCard(
        widget.tag,
        widget.title,
        widget.description ?? "",
        widget.amount,
        widget.image,
        widget.color ?? "",
        widget.size ?? "",
        widget.qty ?? 1);
  }

  Widget _buildInfoCard(int key, String cardTitle, String cardSubTitle,
      double amount, String image, String color, String size, double qty) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 120,
        child: Card(
          elevation: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: key,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
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
                                Text(
                                  cardTitle,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xFF4F4F4F),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rs." + amount.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Color(0xFFA8A8A8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipOval(
                            child: Material(
                              color: Color(0xFFC7CFCF),
                              child: InkWell(
                                splashColor: Color(0x33FFFFFF),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  color != null && color != ""
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Color",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFDFDFDF),
                                              ),
                                            ),
                                            Text(
                                              color,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF737373),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  size != null &&
                                          size != "" &&
                                          color != null &&
                                          color != ""
                                      ? Container(
                                          width: 10,
                                        )
                                      : Container(),
                                  size != null && size != ""
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Size",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFDFDFDF),
                                              ),
                                            ),
                                            Text(
                                              size,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF737373),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Row(
                                children: <Widget>[
                                  ClipOval(
                                    child: Material(
                                      color: Color(0xFFf0f5f8),
                                      child: InkWell(
                                        splashColor: Color(0x337dccc0),
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Icon(
                                            Icons.remove,
                                            size: 16,
                                            color: Config.primaryColor,
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    qty.toInt().toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Color(0xFFf0f5f8),
                                      child: InkWell(
                                        splashColor: Color(0x337dccc0),
                                        child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Icon(
                                            Icons.add,
                                            size: 16,
                                            color: Config.primaryColor,
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
