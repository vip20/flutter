import 'package:flutter/material.dart';

class ProdPage extends StatelessWidget {
  final String arguments;
  ProdPage({Key key, @required this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Page $arguments"),
    );
  }
}
