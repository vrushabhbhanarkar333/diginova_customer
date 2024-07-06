import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diginova/global/utility.dart';
import 'package:diginova/screens/authentication/login_page.dart';
import 'package:diginova/utils/bottom_nav_bar.dart';
import 'package:diginova/screens/qr_scan/qr_scan.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: checkLoginStatus(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data == true) {
              return QrScanner();
            } else {
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jwtToken = prefs.getString(UserDataManager.jwtTokenKey);
  return jwtToken != null && jwtToken.isNotEmpty;
}
