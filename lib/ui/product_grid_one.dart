import 'package:flutter/material.dart';
import 'package:lazybitui/utils/config.dart';
import 'package:lazybitui/views/product_view_one.dart';

class ProductGridOne extends StatefulWidget {
  @override
  _ProductGridOne createState() => _ProductGridOne();
}

class _ProductGridOne extends State<ProductGridOne> {
  List<Widget> items = [
    ProductViewOne(
        tag: 0,
        title: "Greenlight",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 450),
    ProductViewOne(
        tag: 1,
        title: "Tolliver",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 550),
    ProductViewOne(
        tag: 2,
        title: "Ukuran",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 650),
    ProductViewOne(
        tag: 3,
        title: "Skelly",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 750),
    ProductViewOne(
        tag: 4,
        title: "Greenlight",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 850),
    ProductViewOne(
        tag: 5,
        title: "Tolliver",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 950),
    ProductViewOne(
        tag: 6,
        title: "Ukuran",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 1050),
    ProductViewOne(
        tag: 7,
        title: "Skelly",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        amount: 1150)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      width: double.maxFinite,
      color: Config.backgroundColor,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.77),
        children: items,
      ),
    );
  }
}
