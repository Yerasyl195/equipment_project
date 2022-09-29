import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/MyEquipments.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/main/main_screen.dart';
import 'package:firebase_project/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import '../../main/main_lessor_screen.dart';
import '../../search/components/search_form.dart';

class AddEquipmentForm extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEquipmentModel = TextEditingController();
  TextEditingController _controllerEquipmentDescription = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String typeOfEquipment = "";
  String region = "all";
  int orderAmount = 0;
  String image = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      //key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Equipment",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: defaultPadding * 1.5),
          DropdownButtonFormField(
            icon: SvgPicture.asset("assets/icons/address.svg"),
            items: area.map<DropdownMenuItem<String>>((String category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) { region = value.toString(); },
            validator: RequiredValidator(errorText: requiredField),
            decoration: dropdownInputDecoration.copyWith(
              hintText: "Ваш регион",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: DropdownButtonFormField(
              icon: SvgPicture.asset(
                "assets/icons/stethoscope.svg",
                height: 17,
                color: Color(0xFF677B92),
              ),
              items:
              currencies.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) { typeOfEquipment = value.toString(); },
              validator: RequiredValidator(errorText: requiredField),
              decoration: dropdownInputDecoration.copyWith(
                hintText: "Тип техники",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              onSaved: (newValue) {},
              decoration: InputDecoration(labelText: "Модель техники",
                  filled: true,
                  fillColor: Colors.white),
              controller: _controllerEquipmentModel,
              //keyboardType: TextInputType.phone,
            ),
          ),
          TextFormField(
            onSaved: (newValue) {},
            decoration: InputDecoration(labelText: "Описание техники",
            filled: true,
            fillColor: Colors.white),
            controller: _controllerEquipmentDescription,
            //keyboardType: TextInputType.phone,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              onSaved: (newValue) {},
              decoration: InputDecoration(labelText: "Цена за час",
                  filled: true,
                  fillColor: Colors.white),
              keyboardType: TextInputType.number,
              controller: _controllerPrice,
              //keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if(typeOfEquipment != "" && _controllerEquipmentModel.text != null && _controllerPrice.text != null) {
                  final User? user = firebaseAuth.currentUser;
                  if(user != null) {
                    firebaseFirestore.collection(
                        FirestoreConstants.pathEquipmentsCollection).doc(user.uid).set({
                      FirestoreConstants.region: region,
                      FirestoreConstants.typeOfEquipment: typeOfEquipment,
                      FirestoreConstants.equipmentDescription: _controllerEquipmentDescription.text,
                      FirestoreConstants.equipmentModel: _controllerEquipmentModel.text,
                      FirestoreConstants.price: _controllerPrice.text,
                      FirestoreConstants.orderAmount: 0,
                      FirestoreConstants.image: image,
                      FirestoreConstants.id: FirebaseAuth.instance.currentUser?.uid
                    });
                    myEquipment = new MyEquipment(equipmentModel: _controllerEquipmentModel.text,
                        equipmentDescription: _controllerEquipmentDescription.text,
                        price: _controllerPrice.text, region: region,
                        typeOfEquipment: typeOfEquipment, orderAmount: orderAmount, image: image);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainLessorScreen(),
                      ),
                    );
                  }
                }
              },
              child: Text("Добавить"),
            ),
          ),
        ],
      ),
    );
  }
}
