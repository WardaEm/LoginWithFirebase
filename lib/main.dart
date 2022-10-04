import 'package:dre/screens/auth_screen.dart';
import 'package:dre/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'onboarding/onboarding_screen.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)
          ),
           disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)
            ),
           focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)
            )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      routes: {
        'SignIn': (context) => AuthScreen(authType: AuthType.SignIn, ),
        'SignUp': (context) => AuthScreen(authType: AuthType.SignUp),
        'home':(context)=>Home(),
      }
    );
  }
}

