import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home_page.dart';
import 'package:flutter_demo/utils/router.dart';
import 'package:flutter_demo/utils/uidata.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => Router.generateRoute(settings),
      initialRoute: UIData.homeRoute,
    );
  }
}
