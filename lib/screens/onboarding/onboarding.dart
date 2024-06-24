import 'package:diginova/global/constant.dart';
import 'package:diginova/global/wrapper.dart';
import 'package:diginova/screens/authentication/login_page.dart';
import 'package:diginova/screens/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  final List<Map<String, dynamic>> images = [
    {
      'image':
          'assets/images/on_boarding_images/3d-casual-life-chart-and-statistics-on-phone.png',
      'property': 'Analyse system tracking',
      'text': 'Keep things running smoothly with our system tracking',
    },
    {
      'image':
          'assets/images/on_boarding_images/3d-casual-life-scanning-qr-code.png',
      'property': 'QR Code',
      'text': 'Scan the code and get an Live work Updates in real-time',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoginPage();
          } else {
            return OnboardingPage(
              pageIndex: _currentPage,
              title: 'Novasmart',
              image: images[_currentPage]['image'],
              titleText: images[_currentPage]['property'],
              subtitleText: images[_currentPage]['text'],
            );
          }
        },
        // child: OnboardingPage(
        //   pageIndex: _currentPage,
        //   title: 'Novasmart',
        //   image: images[_currentPage]['image'],
        //   titleText: images[_currentPage]['property'],
        //   subtitleText: images[_currentPage]['text'],
        // ),
      ),
      floatingActionButton: SizedBox(
        height: 54,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            if (_currentPage < images.length - 1) {
              setState(() {
                _currentPage++;
              });
            } else {
              _navigateToSplashScreen();
            }
          },
          backgroundColor: DEFAULT_CLR,
          child: SvgPicture.asset(
            'assets/icons/arrow_forward.svg',
          ),
        ),
      ),
    );
  }

  void _navigateToSplashScreen() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Wrapper(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const beginOffset = Offset(100.0, 0.0); // Start from off-screen right
          const endOffset = Offset.zero; // Slide in to the center of the screen

          var curve = Curves.easeInBack;
          var tween = Tween(begin: beginOffset, end: endOffset)
              .chain(CurveTween(curve: curve));

          // Additional scale animation
          var scaleTween =
              Tween<double>(begin: 0.5, end: 1.0).animate(animation);

          return SlideTransition(
            position: animation.drive(tween),
            child: ScaleTransition(
              scale: scaleTween,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
