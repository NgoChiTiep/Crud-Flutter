import 'package:crud/src/component/header.dart';
import 'package:crud/src/component/showToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Header(body: NewScreens(), title: 'Số dư ví');
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
    // TODO: implement build
    return Container(
      width: width,
      padding: EdgeInsets.only(left: 18, top: 18, right: 18, bottom: 18),
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 3.0,
                    // has the effect of softening the shadow
                    spreadRadius: 2.0,
                    offset: new Offset(0.0, 0.0),
                  )
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            'images/ic_point.png',
                            width: 42,
                            height: 42,
                          ),
                          Container(
                            child: Text(
                              '1000',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
                            ),
                            margin: EdgeInsets.only(left: 10),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/ic_crown.png',
                        width: 42,
                        height: 42,
                      ),
                    ],
                  ),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 17, bottom: 17),
                ),
                Container(
                  width: width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 17, bottom: 17),
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(
                        color: Colors.grey[350],
                        width: 0.5,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Colors.grey[350],
                        width: 0.5,
                        style: BorderStyle.solid),
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hạng vàng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        child: Text(
                            'Bạn cần tích thêm 245 điểm trong tháng để duy trì hạng Vàng'),
                        margin: EdgeInsets.only(top: 6),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 17, bottom: 17),
                  child: Text('23 điểm sắp hết hạng trong tháng này'),
                )
              ],
            ),
          ),

          Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFF0A4DD0),
            ),
            child: FlatButton(
              onPressed: () => _onPressBonusPoint(context),
              child: Text(
                'Tặng điểm thưởng',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onPressBonusPoint(context) {
    Toast(context: context, title: 'Tặng điểm thành công').showToast();
  }
}
