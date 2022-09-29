import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/MyEquipments.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/main/main_lessor_screen.dart';
import 'package:firebase_project/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants.dart';

class SignInForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  void signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text);
      print("ВХОД ВЫПОЛНЕН");
      String id = FirebaseAuth.instance.currentUser!.uid;
      print(id);
      var collection = FirebaseFirestore.instance.collection('users');
      var docSnapshot = await collection.doc(id).get();
      currentUser = UserModel.fromDocument(docSnapshot);
      print(currentUser?.username);
      if(currentUser?.typeOfUser == "lessor"){
        var collectionEq = FirebaseFirestore.instance
            .collection(FirestoreConstants.pathEquipmentsCollection);
        var documentSnapshot = await collectionEq.doc(id).get();
        myEquipment = MyEquipment.fromDocument(documentSnapshot);
      }
    } on FirebaseAuthException catch (ex) {
      String? e = ex.message;
      print('Ошибкаааа $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controllerEmail,
            validator: MultiValidator(
              [
                RequiredValidator(errorText: requiredField),
                EmailValidator(errorText: emailError),
              ],
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "Почта*"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _controllerPassword,
              validator: passwordValidator,
              obscureText: true,
              onSaved: (newValue) {},
              decoration: InputDecoration(labelText: "Пароль*"),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Забыли пароль?"),
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async{
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(_formKey.currentState);
                  signIn();
                  if(currentUser?.typeOfUser == "lessor"){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainLessorScreen(),
                      ),
                    );
                  }
                  else if(currentUser?.typeOfUser == "renting") {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  }
                  else
                    print("НЕТ ТИПА ЮЗЕРА");
                }
              },
              child: Text("Войти"),
            ),
          ),
        ],
      ),
    );
  }

}
