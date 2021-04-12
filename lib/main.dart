import 'package:flutter/material.dart';
import 'file:///D:/schedular/schedular/lib/screens/Teacher_signUp.dart';
import 'file:///D:/schedular/schedular/lib/screens/Student_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schedular/screens/LandingPage.dart';
import 'package:schedular/screens/Student%20DashBoard.dart';
import 'package:schedular/screens/entry_page.dart';
import 'package:schedular/screens/login_page.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/entrypage',
      routes: {
      '/entrypage': (context) => EntryPage(),
      '/studentdashboard': (context) => StudentDashBoard(),
      '/login': (context) => LoginPage(),
      '/teachersignup' : (context) => Tsp(),
       '/studentsignup': (context) => Ssp(),
       '/lp': (context) => LandingPage(),}
   // home: EntryPage(),
  ));
}
