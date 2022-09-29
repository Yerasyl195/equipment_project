import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/constants.dart';

class MyEquipment {
  String equipmentModel;
  String equipmentDescription;
  String price;
  String region;
  String typeOfEquipment;
  int orderAmount = 0;
  String image;

  MyEquipment({required this.equipmentModel, required this.equipmentDescription,
    required this.price, required this.region, required this.typeOfEquipment,
    required this.orderAmount, required this.image});

  Map<String, String?> toJson() {
    return {
      FirestoreConstants.equipmentModel: equipmentModel,
      FirestoreConstants.equipmentDescription: equipmentDescription,
      FirestoreConstants.price: price,
      FirestoreConstants.region: region,
      FirestoreConstants.typeOfEquipment: typeOfEquipment,
      FirestoreConstants.image: image
    };
  }

  factory MyEquipment.fromDocument(DocumentSnapshot doc) {
    String equipmentModel = "";
    String equipmentDescription = "";
    String price = "";
    String region = "";
    String typeOfEquipment = "";
    int orderAmount = 0;
    String image = "";
    try {
      equipmentModel = doc.get(FirestoreConstants.equipmentModel);
    } catch (e) {}
    try {
      equipmentDescription = doc.get(FirestoreConstants.equipmentDescription);
    } catch (e) {}
    try {
      price = doc.get(FirestoreConstants.price);
    } catch (e) {}
    try {
      region = doc.get(FirestoreConstants.region);
    } catch (e) {}
    try {
      typeOfEquipment = doc.get(FirestoreConstants.typeOfEquipment);
    } catch (e) {}
    try {
      orderAmount = doc.get(FirestoreConstants.orderAmount);
    } catch (e) {}
    try {
      image = doc.get(FirestoreConstants.image);
    } catch (e) {}
    return MyEquipment(
      equipmentModel: equipmentModel,
      equipmentDescription: equipmentDescription,
      price: price,
      region: region,
      typeOfEquipment: typeOfEquipment,
      orderAmount: orderAmount,
      image: image
    );
  }
}
MyEquipment? myEquipment;
//List<MyEquipments> demoMyEquipments = [];
/*
  MyEquipments(
    name: "Murzabekov Sultan",
    sector: "Trucks",
    experience: 2,
    patients: '34',
    image: "assets/images/tehnika.png",
  )];
  AvailableEquipments(
    name: "Karabash Radimir",
    sector: "Bulldozers",
    experience: 4,
    patients: '45',
    image: "assets/images/Caterpillar.png",
  ),
  AvailableEquipments(
    name: "Yakovlev Ruslan",
    sector: "Bulldozers",
    experience: 1,
    patients: '26',
    image: "assets/images/bulldozer.png",
  ),
  AvailableEquipments(
    name: "Makhmutov Ansar",
    sector: "Roller",
    experience: 5,
    patients: '58',
    image: "assets/images/veh.png",
  ),
  AvailableEquipments(
    name: "Meirzhan Azat",
    sector: "Excavators",
    experience: 3,
    patients: '5',
    image: "assets/images/ekskovatori.png",
  ),
*/
