import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schedular/Database%20Manager/DatabaseManager.dart';
import 'package:schedular/model/student.dart';
import 'package:schedular/screens/studentdashboard.dart';

import 'auth_provider.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _year = TextEditingController();
  TextEditingController _course = TextEditingController();
  TextEditingController _password = TextEditingController();
  Student _student;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: isLoading == false
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(hintText: "Name"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(hintText: "email"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _password,
                        decoration: InputDecoration(hintText: "Password"),
                        obscureText: true
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _course,
                        decoration: InputDecoration(hintText: "Course"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _branch,
                        decoration: InputDecoration(hintText: "Branch"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _year,
                        decoration: InputDecoration(hintText: "Year"),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              _student = new Student(
                                  _name.text,
                                  _email.text,
                                  _password.text,
                                  _course.text,
                                  _branch.text,
                                  _year.text);
                              isLoading = true;
                            });
                            AuthClass()
                                .createAccount(
                                    email: _email.text.trim(),
                                    password: _password.text.trim())
                                .then((value) {
                              if (value == "Account created") {
                                setState(() {
                                  Database(AuthClass().getCurrentUser())
                                      .sendData(_student.toJson());
                                  isLoading = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StudentDashBoard()),
                                    (route) => false);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(value)));
                              }
                            });
                          },
                          child: Text("Create account")),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text("Already have an account? Login "),
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
