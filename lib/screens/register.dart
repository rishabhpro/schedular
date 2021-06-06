import 'package:flutter/material.dart';

import 'auth_provider.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _branch = TextEditingController();
  TextEditingController _course = TextEditingController();
  TextEditingController _password = TextEditingController();
  //late Student _student;

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
                child: Column(
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
                    // ignore: deprecated_member_use
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            // _student = new Student(_name.text, _email.text,
                            //     _password.text, _course.text, _branch.text);
                            isLoading = true;
                          });
                          AuthClass()
                              .createAccount(
                                  email: _email.text.trim(),
                                  password: _password.text.trim())
                              .then((value) {
                            if (value == "Account created") {
                              setState(() {
                                //sendData("Students", "id", _student.toJson());
                                isLoading = false;
                              });
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
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
              )
            : Center(child: CircularProgressIndicator()));
  }
}
