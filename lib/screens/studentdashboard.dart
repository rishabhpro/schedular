import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:schedular/screens/Calendar.dart';
import 'package:schedular/screens/EventForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schedular/main.dart';
class StudentDashBoard extends StatefulWidget {
  @override
  _StudentDashBoardState createState() => _StudentDashBoardState();
}

class _StudentDashBoardState extends State<StudentDashBoard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id, channel.name, channel.description,
                  color: Colors.blueAccent,
                  playSound: true,
                  icon: '@mipmap/ic_launcher'),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new class is starting');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.redAccent[400],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 40.0, 0.0, 0.0),
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.red[300],
                      radius: 45.0,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                        Text('user.email.cs21@iilmcet.ac.in')
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Icon(
                  Icons.access_alarms_outlined,
                  size: 40,
                ),
                title: RichText(
                  text: TextSpan(
                      text: 'View Timetable',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calendar()));
                        }),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                  leading: Icon(
                    Icons.access_alarms_outlined,
                    size: 40,
                  ),
                  title: RichText(
                    text: TextSpan(
                        text: 'Edit Timetable',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventsPage()));
                          }),
                  )),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 40,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Icon(
                  Icons.assignment_turned_in,
                  size: 40,
                ),
                title: Text(
                  'About App',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
      body: Calendar(),
    );
  }
}
