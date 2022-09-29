import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/models/MyEquipments.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EquipmentLessorCard extends StatelessWidget {
  const EquipmentLessorCard({
    Key? key,
    required this.equipment,
    required this.press,
  }) : super(key: key);

  final MyEquipment equipment;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    equipment.equipmentModel!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPadding / 4),
                  Text(
                    equipment.typeOfEquipment!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    "Experience",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),/*
                  Text(
                    "${equipment.experience} Years",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/
                  Spacer(),
                  Text(
                    "Orders",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    equipment.orderAmount!.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                equipment.image!,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
