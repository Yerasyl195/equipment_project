import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/constants.dart';

class UserModel {
  String id;
  String photoUrl;
  String username;
  String phoneNumber;
  String email;
  String typeOfUser;

  UserModel({required this.id, required this.photoUrl,
    required this.username, required this.phoneNumber,
    required this.email, required this.typeOfUser});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.username: username,
      FirestoreConstants.phoneNumber: phoneNumber,
      FirestoreConstants.photoUrl: photoUrl,
      FirestoreConstants.email: email,
      FirestoreConstants.typeOfUser: typeOfUser
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    String username = "";
    String photoUrl = "";
    String phoneNumber = "";
    String email = "";
    String typeOfUser = "";
    try {
      phoneNumber = doc.get(FirestoreConstants.phoneNumber);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      username = doc.get(FirestoreConstants.username);
    } catch (e) {}
    try {
      email = doc.get(FirestoreConstants.email);
    } catch (e) {}
    try {
      typeOfUser = doc.get(FirestoreConstants.typeOfUser);
    } catch (e) {}
    return UserModel(
      id: doc.id,
      photoUrl: photoUrl,
      username: username,
      phoneNumber: phoneNumber,
      email: email,
      typeOfUser: typeOfUser
    );
  }
}

UserModel? currentUser;
