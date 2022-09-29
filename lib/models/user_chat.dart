import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/constants.dart';

class UserChat {
  String id;
  String photoUrl;
  String username;
  String aboutMe;

  UserChat({required this.id, required this.photoUrl, required this.username, required this.aboutMe});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.username: username,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String username = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      username = doc.get(FirestoreConstants.username);
    } catch (e) {}
    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      username: username,
      aboutMe: aboutMe,
    );
  }
}
