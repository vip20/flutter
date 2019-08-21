import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/uidata.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((product) => Card(
                child: Column(
                  children: <Widget>[
                    new Image.asset(UIData.soupImage),
                    Text(product)
                  ],
                ),
              ))
          .toList(),
    );
  }
}
