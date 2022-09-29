import 'package:firebase_project/constants.dart';
import 'package:firebase_project/screens/auth/sign_up_screen.dart';
import 'package:firebase_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign In",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("Еще нет аккаунта?"),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),
                    ),
                    child: Text("Авторизоваться!"),
                  )
                ],
              ),
              SizedBox(height: defaultPadding * 1.5),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
