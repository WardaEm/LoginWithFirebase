
import 'package:flutter/material.dart';


import '../widgets/auth_form.dart';

enum AuthType { SignIn, SignUp }

class AuthScreen extends StatelessWidget {

  final AuthType authType;

  const AuthScreen({Key ?key, required this.authType,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 65),
                      Text(
                        'Hello Every One!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                  //    Hero(
                  //   tag: 'logoAnimation',
                  //       child: Image.asset(
                  //         'assets/images/1.png',
                  //         height: 250,
                  //       ),
                  // ),
                    ],
                  ),
                ),
              ],
            ),
            AuthForm(authType: authType),
          ],
        ),
      ),
    );
  }
}