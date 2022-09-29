import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/components/heightlight.dart';
import 'package:firebase_project/components/rating.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/appointment/appointment_screen.dart';
import 'package:flutter/material.dart';

import 'components/communication.dart';

class EquipmentDetailsScreen extends StatelessWidget {
  const EquipmentDetailsScreen({
    Key? key,

    required this.equipments
  }) : super(key: key);

  final AvailableEquipments equipments;
  String getImage(String type){
    String path = "assets/images/";
    if(type == "Бульдозер")
      return path+"bulldozer.png";

    else if(type == "Каток")
      return path+"veh.png";

    else if(type == "Погрузчик")
      return path+"ekskovatori.png";

    else if(type == "Самосвал")
      return path+"tehnika.png";

    else if(type == "Экскаватор")
      return path+"ekskov.png";

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(equipments.equipmentModel),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(equipments.image==""? getImage(equipments.typeOfEquipment): equipments.image),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Communication(userId: equipments.id,),
              ),
              Text(
                equipments.typeOfEquipment,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text("Казахстан, " +equipments.region),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Rating(score: 5),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "Описание техники",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(
                  equipments.equipmentDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Highlight(
                      name: "Количсетво\nзаказов",
                      text: equipments.orderAmount.toString(),
                    ),
                    Highlight(
                      name: "Цена за час",
                      text: equipments.price+" ₸",
                    ),/*
                    Highlight(
                      name: "Reviews",
                      text: equipments.,
                    ),*/
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentScreen(equipment: equipments),
                    ),
                  ),
                  child: Text("Забронировать"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
