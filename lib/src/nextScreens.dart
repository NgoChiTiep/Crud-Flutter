import 'package:crud/src/resources/couter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<Counter>(
      builder: (context) => Counter(),
      child: SecondWidget(),
    );
  }
}
class SecondWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    // TODO: implement build
    return Center(
      child: Container(
        child: Text(counter.getCount.toString()) ,
      ),
    );
  }
}

