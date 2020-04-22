import 'package:flutter/material.dart';
import 'package:lazybitui/ui/product_details_one.dart';
import 'package:lazybitui/utils/config.dart';

/*abstract class _ProductViewOneListItemAbs {
  Object buildKey(BuildContext context);

  String buildTitle(BuildContext context);

  String buildDescription(BuildContext context);

  double buildAmount(BuildContext context);

  String buildImage(BuildContext context);
}

class ProductViewOneItem implements _ProductViewOneListItemAbs {
  final Object key;
  final String title;
  final String description;
  final String image;
  final double amount;

  ProductViewOneItem(
      {@required this.key,
      @required this.title,
      @required this.description,
      @required this.image,
      @required this.amount});

  @override
  String buildTitle(BuildContext context) {
    return title;
  }

  @override
  double buildAmount(BuildContext context) {
    return amount;
  }

  @override
  String buildDescription(BuildContext context) {
    return description;
  }

  @override
  Object buildKey(BuildContext context) {
    return key;
  }

  @override
  String buildImage(BuildContext context) {
    return image;
  }
}*/

class ProductViewOne extends StatefulWidget {
  final Object tag;
  final String title;
  final String description;
  final String image;
  final double amount;

  const ProductViewOne(
      {@required this.tag,
      @required this.title,
      @required this.description,
      @required this.image,
      @required this.amount});

  @override
  _ProductViewOne createState() => _ProductViewOne();
}

class _ProductViewOne extends State<ProductViewOne> {
  @override
  Widget build(BuildContext context) {
    return _buildInfoCard(widget.tag, widget.title, widget.description,
        widget.amount, widget.image);
  }

  Widget _buildInfoCard(int key, String cardTitle, String cardSubTitle,
      double amount, String image) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsPageOne(
                  heroTag: key,
                  image: image,
                  title: cardTitle,
                  description: cardSubTitle,
                  price: amount,
                )));
      },
      child: Card(
          elevation: 0,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                    tag: key,
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )),
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cardTitle,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF808080),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(cardSubTitle,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey.withOpacity(0.3),
                            )),
                        Text("Rs." + amount.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Config.primaryColor,
                            ))
                      ],
                    ),
                  ),
                )
              ])),
    );
  }
}
