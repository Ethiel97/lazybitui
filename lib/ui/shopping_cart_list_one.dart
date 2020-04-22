import 'package:flutter/material.dart';
import 'package:lazybitui/utils/config.dart';
import 'package:lazybitui/views/shopping_cart_item_view_one.dart';

class ShoppingCartListOne extends StatefulWidget {
  @override
  _ShoppingCartListOne createState() => _ShoppingCartListOne();
}

class _ShoppingCartListOne extends State<ShoppingCartListOne> {
  List<Widget> items = [
    ShoppingCartItemViewOne(
        tag: 0,
        title: "Greenlight",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 1,
        amount: 450),
    ShoppingCartItemViewOne(
        tag: 1,
        title: "Tolliver",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 2,
        amount: 550),
    ShoppingCartItemViewOne(
        tag: 2,
        title: "Ukuran",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 3,
        amount: 650),
    ShoppingCartItemViewOne(
        tag: 3,
        title: "Skelly",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 4,
        amount: 750),
    ShoppingCartItemViewOne(
        tag: 4,
        title: "Greenlight",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 5,
        amount: 850),
    ShoppingCartItemViewOne(
        tag: 5,
        title: "Tolliver",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 6,
        amount: 950),
    ShoppingCartItemViewOne(
        tag: 6,
        title: "Ukuran",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 7,
        amount: 1050),
    ShoppingCartItemViewOne(
        tag: 7,
        title: "Skelly",
        description: "Jacket 0705",
        image: "assets/productimage.webp",
        color: "Red",
        size: "S",
        qty: 8,
        amount: 1150)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      width: double.maxFinite,
      color: Config.backgroundColor,
      child: ListView(
        children: items,
      ),
    );
  }
}
