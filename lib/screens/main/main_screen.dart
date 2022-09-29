import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/Equipments/equipment_screen.dart';
import 'package:firebase_project/screens/appointment/my_appointment_screen.dart';
import 'package:firebase_project/screens/home/home_screen.dart';
import 'package:firebase_project/screens/profile/profile_screen.dart';
import 'package:firebase_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState(){
    if (firebaseAuth.currentUser?.uid.isNotEmpty == false) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SplashScreen()),
            (Route<dynamic> route) => false,
      );
    }
  }

  final List<Widget> _pages = [
    HomePage(),
    EquipmentScreen(),
    MyAppointmentScreen(),
    ProfileScreen(),
  ];
  int _selectedPage = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(defaultPadding),
        color: Colors.white,
        child: SafeArea(
          child: GNav(
            haptic: true,
            tabBorderRadius: 15,
            curve: Curves.ease,
            duration: Duration(milliseconds: 350),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.people,
                text: 'Equipments',
              ),
              GButton(
                icon: Icons.content_paste,
                text: 'Appointment',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ],
            onTabChange: (pageNum) {
              setState(() {
                _selectedPage = pageNum;
              });
            },
          ),
        ),
      ),
    );
  }

}
