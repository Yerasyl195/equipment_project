import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/firestore_constants.dart';

class AppoinmentRenting {
  String typeOfEquipment;
  String region;
  String id;
  String isConfirmed;
  String isDone;
  String time;

  AppoinmentRenting({required this.typeOfEquipment, required this.region,
    required this.id, required this.isConfirmed, required this.isDone,
    required this.time});

  Map<String, String?> toJson() {
    return {
      FirestoreConstants.typeOfEquipment: typeOfEquipment,
      FirestoreConstants.region: region,
      "isConfirmed": isConfirmed,
      "isDone": isDone,
      "time": time
    };
  }

  factory AppoinmentRenting.fromDocument(DocumentSnapshot doc) {
    String typeOfEquipment = "";
    String region = "";
    String id = "";
    String isConfirmed = "";
    String isDone = "";
    String time = "";
    try {
      typeOfEquipment = doc.get(FirestoreConstants.typeOfEquipment);
    } catch (e) {}
    try {
      region = doc.get(FirestoreConstants.region);
    } catch (e) {}
    try{
      id = doc.get(FirestoreConstants.id);
    } catch (e) {}
    try{
      isConfirmed = doc.get("isConfirmed");
    } catch (e) {}
    try{
      isDone = doc.get(isDone);
    } catch (e) {}
    try{
      time = doc.get(time);
    } catch (e) {}

    return AppoinmentRenting(
        region: region,
        id: id,
        typeOfEquipment: typeOfEquipment,
        isConfirmed: isConfirmed,
        isDone: isDone,
        time: time
    );
  }
}