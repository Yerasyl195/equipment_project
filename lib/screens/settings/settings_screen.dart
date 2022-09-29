import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'components/setting_item_caed.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    currentUser = null;
    print("ВЫХОД УСПЕШНО!!!!");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: defaultPadding),
              SettingTab(
                text: "Notifications",
                iconSrc: "assets/icons/Notificatio_box.svg",
                value: true,
                onChanged: (value) {},
              ),
              SettingTab(
                text: "Message Option",
                iconSrc: "assets/icons/Chat_box.svg",
                value: false,
                onChanged: (value) {},
              ),
              SettingTab(
                text: "Video Call Option",
                iconSrc: "assets/icons/Video_box.svg",
                value: false,
                onChanged: (value) {},
              ),
              SettingTab(
                text: "Call Optionn",
                iconSrc: "assets/icons/Call_box.svg",
                value: true,
                onChanged: (value) {},
              ),
              //Spacer(),
              SizedBox(height: 345),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    _signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),);
                  },
                  child: Text("Exit"),
                ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
