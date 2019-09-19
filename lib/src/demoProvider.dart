import 'package:crud/src/resources/couter.dart';
import 'package:crud/src/nextScreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';



class DemoProvider extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        builder: (context) => Counter(),
        child: TestWidget(),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    print("plussss");
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(counter.getCount.toString(), style: TextStyle(color: Colors.black),),
          RaisedButton(
            onPressed: () => counter.plus(),
            child: Text('Plus'),
          ),
          RaisedButton(
            onPressed: () => onNextScreens(context),
            child: Text('navigate'),
          ),
        ],
      ) ,
    );
  }
  onNextScreens(context){
    var route = MaterialPageRoute(builder: (context)=> NextScreens());
    Navigator.push(context, route);
  }
}
