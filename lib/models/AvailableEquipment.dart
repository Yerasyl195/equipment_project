import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/firestore_constants.dart';

class AvailableEquipments {
  String equipmentModel;
  String equipmentDescription;
  String price;
  String region;
  String typeOfEquipment;
  int orderAmount = 0;
  String image;
  String id;

  AvailableEquipments({required this.equipmentModel, required this.equipmentDescription,
    required this.price, required this.region, required this.typeOfEquipment,
    required this.orderAmount, required this.image, required this.id});

  Map<String, String?> toJson() {
    return {
      FirestoreConstants.equipmentModel: equipmentModel,
      FirestoreConstants.equipmentDescription: equipmentDescription,
      FirestoreConstants.price: price,
      FirestoreConstants.region: region,
      FirestoreConstants.typeOfEquipment: typeOfEquipment,
      FirestoreConstants.image: image,
      FirestoreConstants.id: id
    };
  }

  factory AvailableEquipments.fromDocument(DocumentSnapshot doc) {
    String equipmentModel = "";
    String equipmentDescription = "";
    String price = "";
    String region = "";
    String typeOfEquipment = "";
    int orderAmount = 0;
    String image = "";
    String id = "";
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
    try{
      id = doc.get(FirestoreConstants.id);
    } catch (e) {}
    return AvailableEquipments(
        equipmentModel: equipmentModel,
        equipmentDescription: equipmentDescription,
        price: price,
        region: region,
        typeOfEquipment: typeOfEquipment,
        orderAmount: orderAmount,
        image: image,
        id: id
    );
  }
}

List<AvailableEquipments> demoAvailableEquipments = [
  AvailableEquipments(
    equipmentModel: "Cat 906K",
    typeOfEquipment: "Погрузчик",
    region: "Алматы",
    orderAmount: 15,
    equipmentDescription: "Модель обеспечивает высокую "
        "производительность в сочетании с выдающимися "
        "показателями универсальности. Просторная кабина и джойстиковое "
        "управление обеспечивают высокий комфорт на протяжении всего рабочего дня",
    image: "assets/images/ekskovatori.png",
    price: "10000",
    id: ""
  ),
  AvailableEquipments(
      equipmentModel: "Cat D5",
      typeOfEquipment: "Бульдозер",
      region: "Астана",
      orderAmount: 17,
      equipmentDescription: "Модель двигателя: Cat C7.1; "
          "Полезная мощность: 127 кВт; Эксплуатационная масса: 17 080 - 21 070 кг",
      image: "assets/images/bulldozer.png",
      price: "12000",
      id: ""
  ),
  AvailableEquipments(
      equipmentModel: "Cat 320 GX",
      typeOfEquipment: "Экскаватор",
      region: "Шымкент",
      orderAmount: 8,
      equipmentDescription: "В модели реализована функция регулирования уклона в "
          "стандартной комплектации. Системы Cat GRADE с 2D и Payload, а также"
          " функция Grade Assist устанавливаются на машину на заводе-изготовителе и"
          " повышают эффективность работы оператора до 45%.",
      image: "assets/images/ekskov.png",
      price: "11500",
      id: ""
  ),
  AvailableEquipments(
      equipmentModel: "Cat 777E",
      typeOfEquipment: "Самосвал",
      region: "Актау",
      orderAmount: 18,
      equipmentDescription: "Класс грузоподъёмности: 97,9 т; "
          "Модель двигателя: Cat® C32 ACERT™; Максимальная скорость с грузом: 65,9 км/ч",
      image: "assets/images/tehnika.png",
      price: "8500",
      id: ""
  ),
  AvailableEquipments(
      equipmentModel: "Cat CB10",
      typeOfEquipment: "Каток",
      region: "Талдыкорган",
      orderAmount: 5,
      equipmentDescription: "Модель Cat® CB10 представляет собой 10-тонный двухвальцовый "
          "виброкаток с шириной вальца 1700 мм. Он прекрасно подходит для уплотнения "
          "асфальтобетонных смесей и других сыпучих материалов.",
      price: "5500",
    image: "assets/images/veh.png",
      id: ""
  ),
];
