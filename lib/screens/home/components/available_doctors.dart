import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants/firestore_constants.dart';
import 'package:firebase_project/screens/home/components/available_doctor_card.dart';
import 'package:firebase_project/components/section_title.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AvailableDoctors extends StatelessWidget {
  const AvailableDoctors({
    Key? key,
  }) : super(key: key);

  /*
  @override
  Widget build(BuildContext context) {

    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: SectionTitle(
            title: "Available Equipment",
            pressOnSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            /*child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(FirestoreConstants.pathEquipmentsCollection)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  print("Длина равно"+snapshot.data!.docs.length.toString());
                  if ((snapshot.data?.docs.length ?? 0) > 0) {
                    return ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, index) =>
                          AvailableEquipmentsCard(info: AvailableEquipments.fromDocument(snapshot.data!.docs[index])),
                          //buildItem(context, snapshot.data?.docs[index]),
                      itemCount: snapshot.data?.docs.length,
                      //controller: listScrollController,
                    );
                  } else {
                    return Center(
                      child: Text("No users"),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorConstants.themeColor,
                    ),
                  );
                }
              },
            ),
            */

            children: List.generate(
              demoAvailableEquipments.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: AvailableEquipmentsCard(
                  info: demoAvailableEquipments[index],
                ),
              ),

            ),


          ),
        )
      ],
    );
  }
   */
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(padding: const EdgeInsets.all(defaultPadding),
          child: SectionTitle(
            title: "Available Equipment",
            pressOnSeeAll: () {},),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance
          .collection(FirestoreConstants.pathEquipmentsCollection)
          .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //print("Длина докса = "+snapshot.data!.docs.length.toString());
          if (snapshot.hasData) {
            return Column(
                children: [

              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              children: List.generate(
                snapshot.data!.docs.length,
                (index) => Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: AvailableEquipmentsCard(documentSnapshot: snapshot.data!.docs[index],),
                ),

              ),

              ),
            )
                ]);
          } else {
          return Center(child: Text("No techniq"),);
      }
    })

    ]
    );
  }
}
