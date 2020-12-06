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
          //alignment: Alignment.bottomCenter,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
               // SizedBox(height: 200.0),
                RaisedButton.icon(onPressed: (){}, icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.red[800],),
                    label: Text('Login',
                  style: TextStyle(
                  color: Colors.blueGrey,
                  //backgroundColor: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 40.0,
                  ),
                ),
                ),
            Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 250.0, 5.0, 5.0),
                  child: Row(
                      children: <Widget>[
                        Text('Not a member =>  ',
                        style:TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                        ),
                        ),
                          FlatButton(
                            color: Colors.blueGrey,
                            textColor: Colors.white,
                           // disabledColor: Colors.grey,
                          //  disabledTextColor: Colors.black,
                            //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            //splashColor: Colors.blueAccent,
                            onPressed: () {},
                            child: Text(
                              "Register!",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                      ],
                      ),
                ),
              ],
          ),
      ),
    ),
    );
  }
}
