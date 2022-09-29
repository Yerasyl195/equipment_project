import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class Communication extends StatefulWidget {
  const Communication({
    Key? key,
    required this.userId
  }) : super(key: key);

  @override
  State createState() => CommunicationState(userId: userId);
  final String userId;
}
class CommunicationState extends State<Communication> {
  CommunicationState({Key? key, required this.userId});

  String userId;
  late UserModel owner;

  void getDoc() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(userId).get();
    owner = UserModel.fromDocument(docSnapshot);
 }

  @override
  Widget build(BuildContext context) {
    getDoc();
    //final Uri _url = Uri.parse(owner.phoneNumber);
    //UserModel owner = UserModel.fromDocument();
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xFF51BEFB).withOpacity(0.75),
            ),
            onPressed: ()  => {},//launchUrl(Uri.parse("tel://"+owner.phoneNumber)),
            icon: SvgPicture.asset("assets/icons/Call.svg"),
            label: Text("Voice Call"),
          ),
        ),
        SizedBox(width: defaultPadding / 2),/*
        Expanded(
          child: ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xFF7E51FB).withOpacity(0.75),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Video.svg",
              width: 11,
            ),
            label: Text("Video Call"),
          ),
        ),*/
        SizedBox(width: defaultPadding / 2),
        Expanded(
          child: ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Color(0xFFFBA351).withOpacity(0.75),
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => ChatPage(arguments:
                ChatPageArguments(peerAvatar: owner.photoUrl,
                peerId: owner.id, peerNickname: owner.username)),
                ),
            ),
            icon: SvgPicture.asset(
              "assets/icons/Chat.svg",
              color: Colors.white,
              width: 11,
            ),
            label: Text("Message"),
          ),
        ),
      ],
    );
  }
}
