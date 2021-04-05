import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
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
              controller: _emailController,
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
               controller: _passwordController,
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
                onPressed: () async {
                  _signInWithEmailAndPassword();
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _success == null
                    ? ''
                    : (_success
                    ? 'Successfully signed in ' + _userEmail
                    : 'Sign in failed'),
                style: TextStyle(color: Colors.red),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(5.0, 100.0, 5.0, 5.0),
            //   child: Row(
            //     children: <Widget>[
            //       SizedBox(width: 10.0),
            //       Text('Not a member => ',
            //         style:TextStyle(
            //           color: Colors.blueGrey,
            //           fontSize: 14.2,
            //         ),
            //       ),
            //       FlatButton(
            //         color: Colors.blueGrey,
            //         textColor: Colors.white,
            //         // disabledColor: Colors.grey,
            //         //  disabledTextColor: Colors.black,
            //        // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            //         //splashColor: Colors.blueAccent,
            //         onPressed: () {},
            //         child: Text(
            //           "Register!",
            //           style: TextStyle(fontSize: 20.0),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }
}
