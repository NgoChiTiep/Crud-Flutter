import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateAccount extends StatefulWidget {
  var user = {};

  CreateAccount({Key key, @required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAccountState();
  }
}

class CreateAccountState extends State<CreateAccount> {
  String userName = '';
  String gender;
  String relationship = '';

  List listGender = [
    {
      "gender": "male",
      "code": "1",
    },
    {
      "gender": "female",
      "code": "2",
    }
  ];

  @override
  Widget build(BuildContext context) {
//    print(widget.user);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Create Account' : 'Edit Account'),
        backgroundColor:
            widget.user == null ? Colors.blue[800] : Colors.deepPurple[800],
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
                  widget.user == null
                      ? 'images/ic_card.png'
                      : 'images/ic_editAccount.png',
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
                      color: widget.user == null
                          ? Colors.blue[800]
                          : Colors.deepPurple[800],
                      fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _inputRow(
                        'images/ic_username.png',
                        widget.user == null ? 'Username' : widget.user['name'],
                        onChangeUserName),
                    _inputGender(),
                    _inputRow(
                        'images/ic_relationship.png',
                        widget.user == null
                            ? 'Relationship'
                            : widget.user['relationship'],
                        onChangeRelation),
                  ],
                ),
              ),
              Builder(
                builder: (BuildContext context) => FlatButton(
                  color: widget.user == null
                      ? Colors.blue[800]
                      : Colors.deepPurple[800],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: widget.user == null
                      ? Colors.blue[800]
                      : Colors.deepPurple[800],
                  onPressed: () => onActionUser(context),
                  child: Text(
                    widget.user == null ? "Create" : "Edit",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputGender() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset(
              'images/ic_gender.png',
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            ),
            margin: EdgeInsets.only(right: 20),
          ),
          DropdownButton<String>(
//              hint: Text(listGender[0]['gender']),
              hint: Text('Gender'),
              value: gender,
              onChanged: (String newValue) {
                setState(() {
                  gender = newValue;
                });
              },
              items: listGender.map((value) {
                return new DropdownMenuItem<String>(
                  value: value["code"],
                  child: new Text(
                    value["gender"],
                  ),
                );
              }).toList()),
        ],
      ),
    );
  }

  Widget _inputRow(icon, hint, onChangeText) {
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
              onChanged: (string) => onChangeText(string),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
        ],
      ),
    );
  }

  _validate() {
    if (userName == '') return 'Name may not be blank';
    if (gender == null) return 'Gender may not be blank';
    if (relationship == '') return 'Relationship may not be blank';
    return '';
  }

  onActionUser(context) {
    if (_validate() == '') {
      var user = {};
      if(widget.user == null){
        user = {
          "name": userName,
          "gender": gender,
          "avatar": "",
          "relationship": relationship
        };
      }
      else{
        user = {
          "name": userName,
          "gender": gender,
          "avatar": "",
          "old_name": widget.user["name"],
          "relationship": relationship
        };
      }
      Navigator.pop(context, user);
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(_validate()),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.pink[600],
      ));
    }
  }

  onChangeUserName(string) {
    setState(() {
      userName = string;
    });
    userName = string;
  }

  onChangeRelation(string) {
    setState(() {
      relationship = string;
    });
  }
}
