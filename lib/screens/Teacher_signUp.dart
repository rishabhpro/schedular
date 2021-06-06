// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// final TextEditingController _emailController = TextEditingController();
// final TextEditingController _passwordController = TextEditingController();
// bool _success;
// String _userEmail;
// class Tsp extends StatefulWidget {
//   @override
//   _TspState createState() => _TspState();
// }
//
// class _TspState extends State<Tsp> {
//   final _text = TextEditingController();
//   bool _validate = false;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       //resizeToAvoidBottomPadding: false,
//       body: LayoutBuilder(
//         key: _formKey,
//         builder: (BuildContext context,BoxConstraints viewportConstraints){
//           return  Container(
//             padding: const EdgeInsets.all(15),
//             color: Colors.grey[500],
//             width: double.infinity,
//             child: SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   minHeight: viewportConstraints.maxHeight,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Align(
//                       child: SafeArea(
//                         left: true,
//                         bottom: true,
//                         right: true,
//                         top: true,
//                         minimum: const EdgeInsets.all(16.0),
//                         child: Text(
//                           'Sign up as teacher ',
//                           style: TextStyle(
//                             fontSize: 40,
//                             color: Colors.grey[550],
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     Container(
//                       padding: const EdgeInsets.all(15),
//                       color: Colors.grey[500],
//                       width: double.infinity,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: <Widget>[
//                           // TextField(
//                           //   //controller: _text,
//                           //   style: TextStyle(fontSize: 20 , color: Colors.black38),
//                           //   decoration: InputDecoration(
//                           //     filled: true,
//                           //     fillColor: Colors.grey[200],
//                           //     hintText: 'Name',
//                           //    // errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                           //     contentPadding: const EdgeInsets.all(15),
//                           //     focusedBorder: OutlineInputBorder(
//                           //       borderSide: BorderSide(color: Colors.white),
//                           //       borderRadius: BorderRadius.circular(5),
//                           //     ),
//                           //     enabledBorder: UnderlineInputBorder(
//                           //       borderSide: BorderSide(color: Colors.white),
//                           //       borderRadius: BorderRadius.circular(5),
//                           //     ),
//                           //   ),
//                           // ),
//                           // SizedBox(height: 20,),
//                           TextField(
//                            controller: _emailController,
//                             style: TextStyle(fontSize: 20 , color: Colors.black38),
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               hintText: 'Email Address',
//                             //  errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                               contentPadding: const EdgeInsets.all(15),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                             ),
//
//                           ),
//                           SizedBox(height: 20,),
//                           TextField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             style: TextStyle(fontSize: 20 , color: Colors.black38),
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               hintText: 'Password',
//                             //  errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                               contentPadding: const EdgeInsets.all(15),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 20,),
//                           // TextField(
//                           //   //controller: _text,
//                           //   obscureText: true,
//                           //   style: TextStyle(fontSize: 20 , color: Colors.black38),
//                           //   decoration: InputDecoration(
//                           //     filled: true,
//                           //     fillColor: Colors.grey[200],
//                           //     hintText: 'Confirm Password',
//                           //    // errorText: _validate ? 'Value Can\'t Be Empty' : null,
//                           //     contentPadding: const EdgeInsets.all(15),
//                           //     focusedBorder: OutlineInputBorder(
//                           //       borderSide: BorderSide(color: Colors.white),
//                           //       borderRadius: BorderRadius.circular(5),
//                           //     ),
//                           //     enabledBorder: UnderlineInputBorder(
//                           //       borderSide: BorderSide(color: Colors.white),
//                           //       borderRadius: BorderRadius.circular(5),
//                           //     ),
//                           //   ),
//                           // ),
//                           // SizedBox(height: 20,),
//                           FlatButton(
//                             child: Text('Sign Up',style: TextStyle(fontSize: 20),),
//                             shape: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.white,width: 2),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             padding: const EdgeInsets.all(15),
//                             textColor: Colors.white70,
//                             onPressed: () async{
//
//                                 _register();
//
//                             },
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             child: Text(_success == null
//                                 ? ''
//                                 : (_success
//                                 ? 'Successfully registered ' + _userEmail
//                                 : 'Registration failed')),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       ),
//
//
//     );
//   }
//   void _register() async {
//     final FirebaseUser user = (await
//     _auth.createUserWithEmailAndPassword(
//       email: _emailController.text,
//       password: _passwordController.text,
//     )
//     ).user;
//     if (user != null) {
//       setState(() {
//         _success = true;
//         _userEmail = user.email;
//       });
//     } else {
//       setState(() {
//         _success = true;
//       });
//     }
//   }
// }
