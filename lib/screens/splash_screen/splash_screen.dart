// import 'package:diginova/global/constant.dart';
// import 'package:diginova/screens/onboarding/onboarding.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 3)).then(
//       (value) => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => OnBoarding(),
//         ),
//       ),
//     );
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             BACKGROUNDIMAGE,
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: Text(
//               "Novasmart",
//               style: NOVASMART_TXT_STYLE,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
