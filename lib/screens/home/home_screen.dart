import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';
import 'components/available_equipments.dart';
import 'components/categories.dart';
import 'components/recommended_equipments.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePage extends StatelessWidget {
  List<AvailableEquipments> equipments = demoAvailableEquipments;

  @override
  void initState(){
    FirebaseFirestore.instance.collection(FirestoreConstants.pathEquipmentsCollection).snapshots();
    CollectionReference equps = FirebaseFirestore.instance.collection(FirestoreConstants.pathEquipmentsCollection);
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                text: "Find Your",
                title: "Equipment",
              ),
              RecommendedDoctors(),
              Categories(),
              AvailableDoctors()
            ],
          ),
        ),
      ),
    );
  }
}
