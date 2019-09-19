import 'package:crud/src/resources/bonus_point.dart';
import 'package:crud/src/resources/home_screens.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'List users'),
      home: BonusPoint(),
    );
  }
}

