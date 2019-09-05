import 'package:flutter/material.dart';
import 'dash.dart';
import 'config.dart' as config;

//This file is the runner file. Has main function, and is the starting point of the app.
void main() => runApp(DashBoardLayout());
// MyApp()

//THE FOLLOWING CODE IS USED TO CREATE A LOGIN PAGE. IN ORDER TO REINSTATE A LOGIN PAGE, UNCOMMENT THE CODE, AND CHANGE THE MAIN FUNCTION
//TO RENDER MyAPP() FIRST

////***********************************************************************/
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MVoovies',
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//       ),
//       home: MyHomePage(title: 'Login'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextStyle style = TextStyle(fontFamily: 'Montserrat',fontSize:20.0);
//   final myControllerEmail = TextEditingController();
//   final myControllerPassword = TextEditingController();
//   final myControllerPort = TextEditingController();
//   String email;
//   String password;
//   String port;

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myControllerEmail.dispose();
//     myControllerPassword.dispose();
//     super.dispose();
//   }

//   String get user_email {
//     return this.email;
//   }

//   void set userEmail(String email) {
//     this.email = email;
//   }

//   String get user_password {
//     return this.password;
//   }

//   void set userPassword(String password) {
//     this.password = password;

//   }

//   bool isAdmin() {
//     if (this.user_email == 'a' && this.user_password == 'a') {
//       return true;
//     }
//     print(this.user_email );
//     print(this.user_password);
//     return false;
//   }

//    @override
//       Widget build(BuildContext context) {

//         final emailField = TextField(
//           obscureText: false,
//           style: style,
//           controller: myControllerEmail,
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//               hintText: "Email",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//         );
//         final passwordField = TextField(
//           obscureText: true,
//           style: style,
//           controller: myControllerPassword,
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//               hintText: "Password",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//         );
//         final portField = TextField(
//           style: style,
//           controller: myControllerPort,
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//               hintText: "Port Number",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//         );
//         final loginButon = Material(
//           elevation: 5.0,
//           borderRadius: BorderRadius.circular(30.0),
//           color: Color(0xff01A0C7),
//           child: MaterialButton(
//             minWidth: MediaQuery.of(context).size.width,
//             padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             onPressed: () {
//               this.email = myControllerEmail.text;
//               this.password = myControllerPassword.text;
//               this.port = myControllerPort.text;
//               config.port = int.tryParse(this.port);
//               print("Port: " + config.port.toString());


//               if (isAdmin()) {

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DashBoardLayout()),
//                 );
//               } else {
//                 return showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text("Either your email or password is incorrect. Please try again!"),
//                     );
//                   }
//                 );
//               }
//             },
//             child: Text("Login",
//                 textAlign: TextAlign.center,
//                 style: style.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.bold)),
//           ),
//         );

//         return Scaffold(
//           body: Center(
//             child: Container(
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(36.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(
//                       height: 155.0,
//                       child: Text(
//                         "MVoovies",
//                         textAlign: TextAlign.center,
//                         style: style,
//                       ),
//                     ),
//                     SizedBox(height: 45.0),
//                     portField,
//                     SizedBox(height: 25.0),
//                     emailField,
//                     SizedBox(height: 25.0),
//                     passwordField,
//                     SizedBox(
//                       height: 35.0,
//                     ),
//                     loginButon,
//                     SizedBox(
//                       height: 15.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       } 
// }
// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
