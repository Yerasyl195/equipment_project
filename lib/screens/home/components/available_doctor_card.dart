import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/components/rating.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/providers/home_provider.dart';
import 'package:firebase_project/screens/details/equipment_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AvailableEquipmentsCard extends StatelessWidget {
  const AvailableEquipmentsCard({
    Key? key,
    //required this.info,
    required this.documentSnapshot
  }) : super(key: key);
  final DocumentSnapshot documentSnapshot;

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
    AvailableEquipments info = AvailableEquipments.fromDocument(documentSnapshot);
    Random random = new Random();
    return FittedBox(
      child: GestureDetector(
        onTap: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EquipmentDetailsScreen(equipments: info),
              ));
        },
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.equipmentModel!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    info.typeOfEquipment!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Rating(score: (5 * random.nextDouble()).toInt()),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    "Регион",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    info.region,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    "Цена",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    "${info.price} ₸/час",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    "Количсетво заказов",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    info.orderAmount.toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),

              Image.asset(
                info.image != ""? info.image: getImage(info.typeOfEquipment),
                height: 100,
                width: 140,
                fit: BoxFit.cover,
              )

            ],
          ),
        ),
      ),
    );
  }

  /*
  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      AvailableEquipments equipment = AvailableEquipments.fromDocument(
          document);
      Random random = new Random();

      return FittedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EquipmentDetailsScreen(equipments: equipment),
                ));
          },
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Row(
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      equipment.equipmentModel!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    ),
                    Text(
                      equipment.typeOfEquipment!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: Rating(score: (5 * random.nextDouble()).toInt()),
                    ),
                    SizedBox(height: defaultPadding / 2),
                    Text(
                      "Регион",
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    Text(
                      equipment.region,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    ),
                    SizedBox(height: defaultPadding / 2),
                    Text(
                      "Цена",
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    Text(
                      "${equipment.price} ₸/час",
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    ),
                    SizedBox(height: defaultPadding / 2),
                    Text(
                      "Количсетво заказов",
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    Text(
                      equipment.orderAmount.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle2,
                    ),
                  ],
                ),

                Image.asset(
                  equipment.image!,
                  height: 100,
                  width: 140,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
        ),
      );
    }
    else {
      return SizedBox.shrink();
    }
  }*/
}
