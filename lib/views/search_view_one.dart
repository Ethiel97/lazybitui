import 'dart:math';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:lazybitui/utils/config.dart';

class SearchViewOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 2),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 10),
                  height: 50,
                  width: 50,
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
                  child: SearchBar(
                    onSearch: (String s) {
                      List<String> result = [
                        "aaa" + (new Random().nextInt(10000).toString()),
                        "bbb" + (new Random().nextInt(10000).toString()),
                        "ccc" + (new Random().nextInt(10000).toString()),
                        "ddd" + (new Random().nextInt(10000).toString()),
                        "eee" + (new Random().nextInt(10000).toString()),
                        "fff" + (new Random().nextInt(10000).toString()),
                        "ggg" + (new Random().nextInt(10000).toString())
                      ];

                      for (int i = 0; i < 10; i++) {
                        result.add(i.toString() +
                            " - " +
                            new Random().nextInt(10000).toString());
                      }
                      return Future.value(result);
                    },
                    onItemFound: (String selectedItem, int index) {
                      return Container(
                        child: ListTile(
                          title: Text(selectedItem),
                          isThreeLine: true,
                          subtitle: Text(selectedItem +
                              " - Subtitle - " +
                              (new Random().nextInt(10000).toString())),
                          onTap: () {},
                        ),
                      );
                    },
                    hintText: "Search Something...",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
