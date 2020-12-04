import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bgtwo.png'),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(0.0, 310.0, 0.0, 0.0),),
            TextField(
              style: TextStyle(fontSize: 20.0,color: Colors.black54),
              decoration:InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Enter Email',
                contentPadding:EdgeInsets.all(15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(500),
                ),
              ) ,
            ),
            SizedBox(height: 15.0),
            TextField(
              // controller: _text,
              style: TextStyle(fontSize: 20.0 , color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Enter Password',
                //  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                contentPadding: const EdgeInsets.all(15),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
            SizedBox(height:10.0 ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
               // color: Colors.blueGrey,
                textColor: Colors.blueGrey,
                // disabledColor: Colors.grey,
                //  disabledTextColor: Colors.black,
               // padding: EdgeInsets.fromLTRB(5.0, 10.0, 200.0, 0.0),
                //splashColor: Colors.blueAccent,
                onPressed: () {},
                child: Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(width: 80.0),
              FlatButton(
                 color: Colors.red,
                textColor: Colors.black,
                // disabledColor: Colors.grey,
                //  disabledTextColor: Colors.black,
               // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                //splashColor: Colors.blueAccent,
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                SizedBox(width: 10.0),
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
                 // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
    );
  }
}
