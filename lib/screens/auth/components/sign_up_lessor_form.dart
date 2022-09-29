import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/Equipments/add_equipment_screen.dart';
import 'package:firebase_project/screens/main/main_lessor_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';

class SignUpLessorForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerUserName = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<bool> handleSignUp(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: pwd);
      return true;
    } on FirebaseAuthException catch (ex) {
      String? e = ex.message;
      print('Ошибкаааа $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String _password = "";
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "ФИО*"),
            controller: _controllerUserName,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: MultiValidator(
                [
                  RequiredValidator(errorText: requiredField),
                  EmailValidator(errorText: emailError),
                ],
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) {},
              decoration: InputDecoration(labelText: "Почта*"),
              controller: _controllerEmail,
            ),
          ),
          TextFormField(
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "Номер телефона"),
            keyboardType: TextInputType.phone,
            controller: _controllerPhone,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: passwordValidator,
              obscureText: true,
              onChanged: (value) => _password = value,
              onSaved: (pass) {},
              decoration: InputDecoration(labelText: "Пароль*"),
              controller: _controllerPassword,
            ),
          ),
          TextFormField(
            validator: (val) =>
                MatchValidator(errorText: 'Пароль не совпадает')
                    .validateMatch(val!, _password),
            obscureText: true,
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "Повторный пароль*"),
          ),
          SizedBox(height: defaultPadding * 1.5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  handleSignUp(_controllerEmail.text,
                      _controllerPassword.text).then((isSuccess) {
                    if(isSuccess) {
                      final User? user = firebaseAuth.currentUser;
                      if(user != null){
                        print("IDDDDIIIIDDDDD ISSSSS");
                        print(user.uid);
                        //int id = new DateTime.now().millisecondsSinceEpoch;
                        firebaseFirestore.collection(FirestoreConstants.pathUserCollection).doc(user.uid).set({
                          FirestoreConstants.username: _controllerUserName.text,
                          FirestoreConstants.photoUrl: "",
                          FirestoreConstants.id: user.uid.toString(),
                          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
                          FirestoreConstants.email: _controllerEmail.text,
                          FirestoreConstants.phoneNumber: _controllerPhone.text,
                          FirestoreConstants.chattingWith: null,
                          FirestoreConstants.typeOfUser: "lessor",
                        });
                        currentUser = UserModel(id: user.uid.toString(),
                            photoUrl: "", username: _controllerUserName.text,
                            phoneNumber: _controllerPhone.text, email: _controllerEmail.text,
                            typeOfUser: "renting");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEquipmentScreen(),
                          ),);
                      }
                      else
                        Fluttertoast.showToast(msg: "ОШИБКА РЕГИ");
                    }
                  }).catchError((error, stackTrace) {
                    Fluttertoast.showToast(msg: error.toString());
                  });
                }
              },
              child: Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}
