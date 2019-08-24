import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home_page.dart';
import 'package:flutter_demo/page/prod_page.dart';
import 'package:flutter_demo/utils/uidata.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    print(settings);
    switch (settings.name) {
      case UIData.homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case UIData.productRoute:
        if (arguments is String) {
          return MaterialPageRoute(
              builder: (_) => ProdPage(arguments: arguments));
        } else {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
