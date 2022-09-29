import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/firestore_constants.dart';

class AppoinmentLessor {
  String username;
  String region;
  String id;
  String isConfirmed;
  String isDone;
  String time;

  AppoinmentLessor({required this.username, required this.region,
    required this.id, required this.isConfirmed, required this.isDone,
    required this.time});

  Map<String, String?> toJson() {
    return {
      FirestoreConstants.username: username,
      FirestoreConstants.region: region,
      "isConfirmed": isConfirmed,
      "isDone": isDone,
      "time": time
    };
  }

  factory AppoinmentLessor.fromDocument(DocumentSnapshot doc) {
    String username = "";
    String region = "";
    String id = "";
    String isConfirmed = "";
    String isDone = "";
    String time = "";
    try {
      username = doc.get(FirestoreConstants.username);
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

    return AppoinmentLessor(
        region: region,
        id: id,
      username: username,
      isConfirmed: isConfirmed,
      isDone: isDone,
      time: time
    );
  }
}
