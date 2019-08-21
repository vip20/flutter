import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/tools/image-clipper.dart';
import 'package:flutter_demo/tools/sliverappbar-title.dart';
import 'package:flutter_demo/utils/uidata.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> _products = ['Product 0'];
  @override
  Widget build(BuildContext context) {
    final _itemExtent = 100.0;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.black,
          onPressed: () {
            setState(() {
              var count = _products.length;
              _products.add("Product $count");
            });
          },
        ),
        body: SafeArea(
            top: false,
            bottom: true,
            child: Container(
                child: Stack(fit: StackFit.expand, children: <Widget>[
              Container(
                  height: 100.0,
                  child: ClipPath(
                    child: new Image.asset(
                      UIData.appBkgImage,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.8),
                      colorBlendMode: BlendMode.dstATop,
                    ),
                    clipper: TitleImageClipper(borderRadius: 5.0),
                  )),
              CustomScrollView(slivers: <Widget>[
                SliverAppBarTitle(),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                            height: _itemExtent,
                            padding: EdgeInsets.only(left: 15.0),
                            child: Card(
                              child: Column(
                                children: <Widget>[
                                  Container(child: Text(_products[index]))
                                ],
                              ),
                            )),
                        childCount: _products.length))
              ])
            ]))));
  }
}
