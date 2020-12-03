import 'package:flutter/material.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("schedular"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: InkWell( //This widget is used when we don't want a button but want to navigate to some other page or do some other action it
          // it has a ontap property that is set to null for now
          onTap: null,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                CircleAvatar(
                  radius: 160,
                  child: Text("App logo"),
                ),
                Divider(
                  color: Colors.black38,
                  height: 60.0,
                  indent: 50.0,
                  endIndent: 50.0,
                ),
                FlatButton( // here i have created a button which will navigate to another page
                  onPressed: null,
                  child: Text(
                    "Get Started ",
                    style: TextStyle(
                      fontSize: 30.0,

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
