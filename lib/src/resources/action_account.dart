import 'package:crud/src/blocs/action_account_blocs.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ActionAccount extends StatefulWidget {
  var user = {};

  ActionAccount({Key key, @required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateAccountState();
  }
}

class CreateAccountState extends State<ActionAccount> {
  TextEditingController userName = new TextEditingController();
  String gender;
  TextEditingController relationship = new TextEditingController();
  ActionAccountBloc bloc = new ActionAccountBloc();

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
                        userName),
                    _inputGender(),
                    _inputRow(
                        'images/ic_relationship.png',
                        widget.user == null
                            ? 'Relationship'
                            : widget.user['relationship'],
                        relationship),
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

  Widget _inputRow(icon, hint, controller) {
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
              maxLines: null,
              controller: controller,
              decoration: InputDecoration(

                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }


  onActionUser(context) {
    print('context: $context');
    String mess = '';
    bloc.validateStream.listen((data) {
      print("DataReceived: " + data);
      mess = data;
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      print("Some Error");
    });
    if (bloc.isValidate(userName.text, gender, relationship.text)) {
      var user = {};
      if (widget.user == null) {
        user = {
          "name": userName.text,
          "gender": gender,
          "avatar": "",
          "relationship": relationship.text
        };
      } else {
        user = {
          "name": userName.text,
          "gender": gender,
          "avatar": "",
          "old_name": widget.user["name"],
          "relationship": relationship.text
        };
      }
      Navigator.pop(context, user);
    } else {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: StreamBuilder(
            stream: bloc.validateStream,
            builder: (BuildContext context, snapshot) {
              print('snapshot: $context');
              return Text(mess);
            }),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.pink[600],
      ));
    }
  }
}
