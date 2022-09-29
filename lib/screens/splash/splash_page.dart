import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/constants/color_constants.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/MyEquipments.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/main/main_lessor_screen.dart';
import 'package:firebase_project/screens/main/main_screen.dart';
import 'package:firebase_project/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      // just delay for showing this slash page clearer because it too fast
      checkSignedIn();
    });
  }
  //UserModel? userModel;
  void checkSignedIn() async{
    if (FirebaseAuth.instance.currentUser != null) {
      String id = FirebaseAuth.instance.currentUser!.uid;
      var collection = FirebaseFirestore.instance.collection('users');
      var docSnapshot = await collection.doc(id).get();
      currentUser = UserModel.fromDocument(docSnapshot);
      print(currentUser?.typeOfUser);

      if(currentUser!.typeOfUser == "lessor") {
        //print("EQUIPMENT INFO SUCCESSEFULLY SET");
        var collectionEq = FirebaseFirestore.instance.collection(FirestoreConstants.pathEquipmentsCollection);
        var documentSnapshot = await collectionEq.doc(id).get();
        myEquipment = MyEquipment.fromDocument(documentSnapshot);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainLessorScreen()),
        );
      }
      else if(currentUser!.typeOfUser == "renting"){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }

      else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
      }
    }

    else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    }
  }
/*
  void checkSignedIn() async{
    //bool isLoggedIn = await FirebaseAuth.instance.currentUser.
    //bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn() == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    }
    else {
      print("ДОШЛО ДО СЮДА?Ю???????ЮЮ!!!!");
      if(currentUser!.typeOfUser == "lessor") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainLessorScreen()),
        );
      }
      else if(currentUser!.typeOfUser == "renting"){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
      else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/icons/empty.png",
              width: 350,
              height: 350,
            ),
            SizedBox(height: 20),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: ColorConstants.themeColor),
            ),
          ],
        ),
      ),
    );
  }
}
