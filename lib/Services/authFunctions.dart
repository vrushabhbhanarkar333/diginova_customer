// import 'package:diginova/Services/firebasefunctions.dart';
// import 'package:diginova/utils/bottom_nav_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AuthServices {
//   void signupUser(
//       String email,
//       String password,
//       String yourName,
//       String customerId,
//       String projectId,
//       String phoneNumber,
//       String rePassword,
//       BuildContext context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);

//       await FirebaseAuth.instance.currentUser!.updateDisplayName(yourName);
//       await FirebaseAuth.instance.currentUser!.updateEmail(email);
//       await FirestoreServices.saveUser(yourName, email, customerId, projectId,
//           phoneNumber, userCredential.user!.uid);
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Accounct created Successfully')));
//       Get.to(const BottomNavigationBarScreen());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Password Provided is too weak')));
//       } else if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Email Provided already Exists')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//   }

//   void signinUser(String email, String password, BuildContext context) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);

//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('You are Logged in')));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No user Found with this Email')));
//       } else if (e.code == 'wrong-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Password did not match')));
//       }
//     }
//   }
// }
