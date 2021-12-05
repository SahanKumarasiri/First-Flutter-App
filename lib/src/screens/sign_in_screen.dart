// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:myfirstapp/src/res/custom_colors.dart';
import 'package:myfirstapp/src/utils/auth.dart';
import 'package:myfirstapp/src/widgets/google_sign_in_button.dart';
import 'dart:ui' as ui;

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/firebase_logo.png',
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "සි තු වි ලි ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          foreground: Paint()
                            ..shader = ui.Gradient.linear(
                              const Offset(0, 50),
                              const Offset(150, 20),
                              <Color>[
                                Colors.red,
                                Colors.yellow,
                              ],
                            )),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Feelings 😇",
                        style: TextStyle(
                          color: Colors.lightGreenAccent,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Text(
                        'Powered by Amaya',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
