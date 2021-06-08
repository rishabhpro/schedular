import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:schedular/main.dart';
import 'auth_provider.dart';
import 'home.dart';
import 'register.dart';
import 'reset.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = FirebaseAuth.instance.currentUser.email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channel.description,
                  color: Colors.blueAccent,
                  playSound: true,
                  icon: '@mipmap/ic_launcher'
              ),
            )
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print('A new class is starting');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if(notification != null && android != null){
        showDialog(
            context: context,
            builder: (_){
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body)

                    ],
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
        title: Text("Home"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Text("email $email"),
      ),
    );
  }
}
