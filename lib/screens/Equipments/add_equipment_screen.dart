import 'package:firebase_project/constants.dart';
import 'package:firebase_project/screens/Equipments/components/add_equipment_form.dart';
import 'package:firebase_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';


class AddEquipmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Text(
                "Add Equipment",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                    child: Text("Sign In!"),
                  )
                ],
              ),
              SizedBox(height: defaultPadding * 1.5),*/
              AddEquipmentForm(),
            ],
          ),
        ),
      ),
    );
  }
}
