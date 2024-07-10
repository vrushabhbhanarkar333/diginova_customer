import 'package:diginova/bloc/bloc/project_bloc.dart';
import 'package:diginova/firebase.options.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/wrapper.dart';
import 'package:diginova/provider/raise_ticket.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'provider/chat.dart';
import 'provider/my_details.dart';
import 'provider/project_status.dart';
import 'provider/service_booking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
  //   // argument for `webProvider`
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
  //   // your preferred provider. Choose from:
  //   // 1. Debug provider
  //   // 2. Safety Net provider
  //   // 3. Play Integrity provider
  //   androidProvider: AndroidProvider.playIntegrity,
  //   // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
  //   // your preferred provider. Choose from:
  //   // 1. Debug provider
  //   // 2. Device Check provider
  //   // 3. App Attest provider
  //   // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
  //   appleProvider: AppleProvider.appAttest,
  // );

  // WidgetsFlutterBinding.ensureInitialized();
  // await Future.delayed(const Duration(seconds: 5)); // Wait for 5 seconds
  // FlutterNativeSplash.remove(); // Remove splash screen immediately

  runApp(
    MultiBlocProvider(
      providers: [ 
        BlocProvider(create: (context)=>ProjectBloc())
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProjectDetailsProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => TicketProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MyDetailsProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ServiceBookingProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ChatProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Wrapper(),
    );
  }
}
