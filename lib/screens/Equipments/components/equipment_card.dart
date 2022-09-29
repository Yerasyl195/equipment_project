import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EquipmentCard extends StatelessWidget {
  const EquipmentCard({
    Key? key,
    required this.equipment,
    required this.press,
  }) : super(key: key);

  final AvailableEquipments equipment;
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
                    equipment.typeOfEquipment,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    "Цена",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "${equipment.price} ₸/час",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Регион",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    equipment.region,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Количсетво заказов",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    equipment.orderAmount.toString(),
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
