import 'package:crud/src/component/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Header(Body: NewScreens(), title: 'Số dư ví');
  }
}

class NewScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BonusPointState();
  }
}

class BonusPointState extends State<NewScreens> {
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController bonusPoint = new TextEditingController();
  TextEditingController mess = new TextEditingController();
  bool disableBtn = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print("load");
    // TODO: implement build
    return Container(
      width: width,
      padding: EdgeInsets.only(left: 18, top: 15, right: 18, bottom: 15),
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF0A4DD0),
             
            ),
            child: FlatButton(
              child: Text('Tặng điểm thưởng', style: TextStyle(color: Colors.white, fontSize: 16),),
            ),
          )
        ],
      ),
    );
  }
}
