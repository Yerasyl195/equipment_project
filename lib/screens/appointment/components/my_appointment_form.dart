import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/AppointmentRenting.dart';
import 'package:firebase_project/models/User.dart';
import 'package:flutter/material.dart';

class MyAppointmentForm extends StatelessWidget {
  const MyAppointmentForm({Key? key, required this.document}) : super(key: key);
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    AppoinmentRenting appoinment = AppoinmentRenting.fromDocument(document);
    DateTime? time = DateTime.tryParse(appoinment.time);
    DateTime now = DateTime.now();

    return FittedBox(
        child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildAppointmentInfo("Date",
                    "${now.day}/${now.month}/${now.year}"),
              ),
              Expanded(
                child: buildAppointmentInfo("Time", "${now.hour}:${now.minute}"),
              ),
              Expanded(
                child:
                buildAppointmentInfo("Provider", "Murzabekov Sultan"),
              ),
            ],
          ),
          Divider(height: defaultPadding * 2),
          Row(
            children: [
              Expanded(
                child: buildAppointmentInfo(
                  "Тип",
                  "АБулшау"
                  //appoinment.typeOfEquipment,
                ),
              ),
              Expanded(
                child: buildAppointmentInfo("Место", "Алматы"),//appoinment.region),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                  TextButton.styleFrom(backgroundColor: redColor),
                  child: Text("Cancel"),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointment"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultPadding / 2)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo("Date",
                              "${_date.day}/${_date.month}/${_date.year}"),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("Time", "10.30 Pm"),
                        ),
                        Expanded(
                          child:
                              buildAppointmentInfo("Provider", "Murzabekov Sultan"),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo(
                            "Type",
                            "Bulldozer",
                          ),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("Place", "Almaty"),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style:
                                TextButton.styleFrom(backgroundColor: redColor),
                            child: Text("Cancel"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/

  Column buildAppointmentInfo(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: textColor.withOpacity(0.62),
          ),
        ),
        Text(
          text,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
