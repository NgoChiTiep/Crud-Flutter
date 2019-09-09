import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAccountState();
  }
}

class CreateAccountState extends State<CreateAccount> {
  String userName = '';
  String gender = '';
  String relationShip = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.blue[800],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'images/ic_card.png',
                  fit: BoxFit.contain,
                  height: width / 3,
                  width: width / 3,
                ),
                margin: EdgeInsets.only(bottom: 70, top: height / 8),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Enter your information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputRow(
                      'images/ic_username.png',
                      'Username',
                    ),
                    InputRow('images/ic_gender.png', 'Gender'),
                    InputRow('images/ic_relationship.png', 'Relationship'),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Create",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget InputRow(icon, hint) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              icon,
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            ),
            margin: EdgeInsets.only(right: 20),
          ),
          Expanded(
            child: TextField(
              onChanged: (string) => onChangeText(string, hint.toLowerCase()),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
        ],
      ),
    );
  }

  onChangeText(string, key) {
    setState(() {
//      [key] = string;
    });
    print('username: $userName');
  }
}
