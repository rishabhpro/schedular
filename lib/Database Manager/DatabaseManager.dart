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
