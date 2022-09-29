import 'package:firebase_project/components/custom_app_bar.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/screens/details/equipment_details_screen.dart';
import 'package:flutter/material.dart';

import 'components/equipment_card.dart';

class EquipmentScreen extends StatelessWidget {
  const EquipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(text: "Available", title: "Equipments"),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: demoAvailableEquipments.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                  ),
                  itemBuilder: (context, index) => EquipmentCard(
                    equipment: demoAvailableEquipments[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EquipmentDetailsScreen(equipments: demoAvailableEquipments[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
