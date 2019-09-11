import 'dart:async';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:crud/createAccount.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var visibleModalDelete = false;
  Future<int> future;
  List data = [];
  var dataAll = [];
  int visible = 0;
  Timer _debounce;
  ScrollController _controller;
  var colorSearch = Colors.transparent;
  var offsetSearch = 100.0;

  _scrollListener() {
    if (_controller.offset >= 200 ) {
      setState(() {
        colorSearch = Colors.white;
//        offsetSearch = 0.0;
      });

    }else{
      setState(() {
        colorSearch = Colors.transparent;
//        offsetSearch = 100.0;
      });
    }
  }

  @override
  void initState() {
    data = [
      {
        "id": 1,
        "name": "Tiep",
        "gender": "1",
        "avatar": "",
        "relationship": "alone"
      },
      {
        "id": 2,
        "name": "Hanh",
        "gender": "2",
        "avatar": "",
        "relationship": "dating"
      },
      {
        "id": 3,
        "name": "Hanh",
        "gender": "2",
        "avatar": "",
        "relationship": "alone"
      },
      {
        "id": 4,
        "name": "Tuan Anh",
        "gender": "1",
        "avatar": "",
        "relationship": "dating"
      },
    ];
    dataAll = [
      {
        "id": 1,
        "name": "Tiep",
        "gender": "1",
        "avatar": "",
        "relationship": "alone"
      },
      {
        "id": 2,
        "name": "Hanh",
        "gender": "2",
        "avatar": "",
        "relationship": "dating"
      },
      {
        "id": 3,
        "name": "Hanh",
        "gender": "2",
        "avatar": "",
        "relationship": "alone"
      },
      {
        "id": 4,
        "name": "Tuan Anh",
        "gender": "1",
        "avatar": "",
        "relationship": "dating"
      },
    ];
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    const timeout = const Duration(seconds: 2);
    if (visible < 1) {
      Timer(timeout, () {
        setState(() {
          visible++;
          future = Future.value(visible);
        });
        print('demoo timeout: $visible');
      });
    }
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        backgroundColor: Colors.pink[600],
//      ),
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            backgroundColor: Colors.pink[600],
            title: Center(
//                child: Transform.translate(
//
//                  offset: Offset(0,offsetSearch),
                  child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: width * 0.8,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: colorSearch),
              child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.pink[600],
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.pink[600]),
                        onChanged: (string) => onChangeText(string),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Search account',
                        ),

                      ),

                    ),
                  ],
              ),
            ),
//                )
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder(
                future: future,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  print("snapshot.hasData:  ${snapshot.data}");
                  return (snapshot.data != null && snapshot.data > 0)
                      ? ListView.builder(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return renderItem(data[index], index);
                          })
                      : renderLoading();
                }),
          )
        ],
      ),

      floatingActionButton: Builder(
        builder: (BuildContext context) => FloatingActionButton(
          backgroundColor: Colors.pink[600],
          onPressed: () => _incrementCounter(context),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  renderLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.pink[600],
      ),
    );
  }

  onChangeText(string) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      print('list: $string');
      var list = dataAll;
      var listSearch = list.where(
          (item) => item['name'].toLowerCase().contains(string.toLowerCase()));
      setState(() {
        data = listSearch.toList();
      });
    });
  }

  Widget renderItem(item, index) {
    return Container(
      color: index % 2 == 0 ? Colors.white : Colors.grey[200],
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Image.asset(
                  item['gender'] == "1"
                      ? 'images/ic_boy.png'
                      : 'images/ic_girl.png',
                  width: 60,
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(bottom: 5)),
                      Text(item['relationship'])
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Builder(
                builder: (BuildContext context) => IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editUser(context, item),
                  color: Colors.blue[800],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_forever),
//                onPressed: () => _askDelete(item),
                onPressed: () => _askDelete(item),
                color: Colors.grey[700],
              )
            ],
          )
        ],
      ),
    );
  }

  Future _editUser(context, item) async {
    var user = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateAccount(user: item),
            fullscreenDialog: true));
    if (user != null) {
      var lst = data;
      var editList = lst.map((e) {
        if (e['name'] == user['old_name']) {
          print('item: $e');
          e = user;
        }
        return e;
      });
      print('edit: $editList');
      setState(() {
        data = editList.toList();
      });
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Edit Success!"),
        backgroundColor: Colors.green,
      ));
    }
  }

  Future _askDelete(item) async {
    switch (await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('Do you want to delete this account?'),
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new SimpleDialogOption(
                    child: new Text('Yes :"('),
                    onPressed: () {
                      _deleteAccount(item);
                      Navigator.pop(context);
                    },
                  ),
                  new SimpleDialogOption(
                    child: new Text('NO :>'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 15),
            )
          ],
        ))) {
    }
  }

  _deleteAccount(item) {
    var list = data.where((obj) => obj['name'] != item['name']).toList();
    setState(() {
      data = list;
      visibleModalDelete = true;
    });
    print('124: $list');
  }

  Future _incrementCounter(context) async {
    Object user = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateAccount(), fullscreenDialog: true));
    print('user :$user');
    if (user != null) {
      var list = data;
      list.add(user);
      setState(() {
        data = list;
      });
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("Create Success!"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
