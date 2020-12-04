import 'dart:ui';
import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/bglogin.png'),
        fit: BoxFit.cover,
    ),
    ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 250.0, 200.42, 0.0),
            child: Column(
              children: <Widget>[
                RaisedButton.icon(onPressed: (){}, icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.red[800],),
                    label: Text('Login',
                  style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 60.0,
                  ),
                ),
                ),
                Text('If you have already created your account with us '
                    'then click on Login button',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
                ),
                SizedBox(height: 20.0),
            Row(children: <Widget>[
              Text('Not a member => ',
              style:TextStyle(
                color: Colors.blueGrey,
                fontSize: 14.2,
              ),
              ),
                FlatButton(
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                 // disabledColor: Colors.grey,
                //  disabledTextColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  //splashColor: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "Regiser!",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
            ],
            ),
              ],
            ),
          ),
      ),
    ),
    );
  }
}
