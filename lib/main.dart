import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flexi_hire/homepage.dart';
// import 'package:flexi_hire/intro_screens/intro_page1.dart';
import 'package:flexi_hire/onboarding_screen.dart';
import 'package:flexi_hire/user_homepage.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UserHomepage();
          } else {
            return OnboardingScreen();
          }
        },
      ),
    );
  }
}
