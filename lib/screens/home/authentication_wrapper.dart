import 'package:diginova/screens/home/home.dart';
import 'package:diginova/screens/onboarding/onboarding.dart';
import 'package:diginova/utils/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance
          .authStateChanges(), // Listen to the user's authentication state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // If the connection state is still waiting, display a loading indicator or splash screen
          return const CircularProgressIndicator(); // Replace with your loading indicator
        } else if (snapshot.hasData) {
          // If the user is authenticated, return the home page
          return const BottomNavigationBarScreen();
        } else {
          // If the user is not authenticated, navigate to the sign-in page
          // You can replace SignInPage() with your sign-in page
          return const OnBoarding();
        }
      },
    );
  }
}
