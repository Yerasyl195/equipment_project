import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:flutter/material.dart';

import 'recommended_equipments_card.dart';
import '../../../models/RecommendEquipments.dart';

class RecommendedDoctors extends StatelessWidget {
  const RecommendedDoctors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85, initialPage: 3),
        itemCount: demoAvailableEquipments.length,
        itemBuilder: (context, index) => RecommendEquipmentsCard(
          availableEquipments: demoAvailableEquipments[index],
        ),
      ),
    );
  }
}
