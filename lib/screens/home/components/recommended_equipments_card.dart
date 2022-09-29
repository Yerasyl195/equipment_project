import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/screens/details/equipment_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/RecommendEquipments.dart';

class RecommendEquipmentsCard extends StatelessWidget {
  const RecommendEquipmentsCard({
    Key? key,
    //required this.doctor,
    required this.availableEquipments
  }) : super(key: key);

  //final RecommendedEquipments doctor;
  final AvailableEquipments availableEquipments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EquipmentDetailsScreen(equipments: availableEquipments),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Не можете найти стройтельную технику в аренду?",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: defaultPadding / 2),
                        width: 2,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xFF83D047),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(defaultPadding)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            availableEquipments.equipmentModel,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            availableEquipments.typeOfEquipment + "\n"
                                + availableEquipments.region,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )

                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(availableEquipments.image),
            ),
          ],
        ),
      ),
    );
  }
}
