import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagramclone/providers/user_provider.dart';
import 'package:instagramclone/responsive/mobile_layout_screen.dart';
import 'package:instagramclone/responsive/responsive_layout_screen.dart';
import 'package:instagramclone/responsive/web_layout_screen.dart';
import 'package:instagramclone/screens/login_screen.dart';
import 'package:instagramclone/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB9Uz6V3mm2IDMiP_d35cRw0-plYh09nWU",
            authDomain: "instagram-709c3.firebaseapp.com",
            projectId: "instagram-709c3",
            storageBucket: "instagram-709c3.appspot.com",
            messagingSenderId: "818527490204",
            appId: "1:818527490204:web:a2e0acc7f2c946f15f9d59",
            measurementId: "G-FBW4N4EZZ6"));
  } else {
    await Firebase.initializeApp();
  }

// Edit error screen
  ErrorWidget.builder = (FlutterErrorDetails details) {
    log(details.exception.toString());
    return Material(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              details.exception.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/logo.png',
        ),
        nextScreen: MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Instagram',
              theme: ThemeData.dark()
                  .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
              // home: const ResponsiveLayout(
              //   mobileScreenLayout: MobileScreenLayout(),
              //   webScreenLayout: WebScreenLayout(),
              // ),
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return const ResponsiveLayout(
                          webScreenLayout: WebScreenLayout(),
                          mobileScreenLayout: MobileScreenLayout());
                    } else {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('${snapshot.error}'),
                        );
                      }
                    }
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  }

                  return const LoginScreen();
                },
              )),
        ),
        backgroundColor: Colors.black,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
