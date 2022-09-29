import 'package:firebase_project/constants.dart';
import 'package:firebase_project/screens/auth/sign_in_screen.dart';
import 'package:firebase_project/screens/auth/sign_up_lessor_screen.dart';
import 'package:firebase_project/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/bg.svg"
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Spacer(),
                  //SvgPicture.asset("assets/icons/gerda_logo.svg"),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        )),

                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      //side: MaterialStateProperty.all(BorderSide(color: CupertinoColors.lightBackgroundGray))
                    ),
                    label: Image.asset("assets/icons/search.png", width: 190, height: 90),

                    icon: Text("Ищете строительную технику?"),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton.icon(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpLessorScreen(),
                        )),

                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      //side: MaterialStateProperty.all(BorderSide(color: CupertinoColors.lightBackgroundGray))
                    ),
                    label: Image.asset("assets/icons/cranes-bulldozer.png", width: 190, height: 90),

                    icon: Text("Есть строительная техника?"),
                  ),

                  Spacer(),
                  SizedBox(height: 10),
                  /*
                  ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        )),
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Color(0xFF6CD8D1),
                    ),
                    child: Text("Sign Up"),
                  ),*/
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          //side: BorderSide(
                            //color: Color(0xFF6CD8D1),
                          //),
                        ),
                        minimumSize: Size(double.infinity, 0),
                        backgroundColor: Colors.transparent,
                        primary: Colors.blue
                      ),
                      child: Text("Уже есть аккаунт?"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
