import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedular/model/student.dart';

class Database {
  String uid;

  final CollectionReference studentReference =
      FirebaseFirestore.instance.collection('Students');
  final CollectionReference timetableReference =
      FirebaseFirestore.instance.collection('TimeTable');

  Database(this.uid);

  void sendData(Map map) async {
    await studentReference.doc(uid).set(map);
  }

  void sendTimetable(String id, Map map) async {
    await timetableReference.doc(id).set(map);
  }

  //user data from snapshot
  Student _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return Student(
        snapshot.get('name'),
        snapshot.get('email'),
        snapshot.get('pass'),
        snapshot.get('course'),
        snapshot.get('branch'),
        snapshot.get('year'));
  }

  //get User doc Stream
  Stream<Student> get userData {
    return studentReference.doc(uid).snapshots().map((_userDataFromSnapshot));
  }

  StreamBuilder timetable() {
    return StreamBuilder(
        stream: timetableReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView();
          } else {
            return Center(
              child: Text("No Data"),
            );
          }
        });
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DatabaseManager {
//   final CollectionReference profileList =
//   Firestore.instance.collection('Time Table');
//
//   Future<void> createUserData(
//       String one, String two, String three, String four, String five) async {
//     return await profileList
//         .document()
//         .setData({'one': one, 'two': two, 'three': three, 'four': four, 'five': five});
//   }
//
//   Future updateUserList(String one, String two, String three, String four,String five) async {
//     return await profileList.document().updateData({
//       'one': one, 'two': two, 'three': three, 'four': four, 'five': five
//     });
//   }
//
//   Future getUsersList() async {
//     List itemsList = [];
//
//     try {
//       await profileList.getDocuments().then((querySnapshot) {
//         querySnapshot.documents.forEach((element) {
//           itemsList.add(element.data);
//         });
//       });
//       return itemsList;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
