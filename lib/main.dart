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
  List<dynamic> data = [];

  @override
  void initState() {
    data = [
      {
        "id": 1,
        "name": "Tiep",
        "gender": 1,
        "avatar": "",
        "relationship": "alone"
      },
      {
        "id": 2,
        "name": "Hanh",
        "gender": 2,
        "avatar": "",
        "relationship": "dating"
      },
      {
        "id": 3,
        "name": "Hanh",
        "gender": 2,
        "avatar": "",
        "relationship": "alone"
      },
      {
        "id": 4,
        "name": "Tuan Anh",
        "gender": 1,
        "avatar": "",
        "relationship": "dating"
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                shrinkWrap: true,
                primary: false,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return renderItem(data[index], index);
                }),
//            visibleModalDelete == true
//                ? SimpleDialog(
//                    title: const Text('Select assignment'),
//                    children: <Widget>[
//                      SimpleDialogOption(
//                        child: const Text('Treasury department'),
//                      ),
//                      SimpleDialogOption(
//                        child: const Text('State department'),
//                      ),
//                    ],
//                  )
//                : null
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[600],
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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
                  item['gender'] == 1
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
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
                color: Colors.blue[800],
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
    var list = data.where((obj) => obj['id'] != item['id']).toList();
    setState(() {
      data = list;
      visibleModalDelete = true;
    });
    print('124: $list');
  }

  void _incrementCounter() {
    final router = new MaterialPageRoute<Null>(
        builder: (context) {
          return CreateAccount();
        },
        fullscreenDialog: true);
    Navigator.push(context, router);
  }
}
//SimpleDialog(
//title: const Text('Select assignment'),
//children: <Widget>[
//SimpleDialogOption(
//child: const Text('Treasury department'),
//),
//SimpleDialogOption(
//child: const Text('State department'),
//),
//],
//)
