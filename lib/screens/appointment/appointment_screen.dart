import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/constants/constants.dart';
import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/models/User.dart';
import 'package:firebase_project/screens/home/home_screen.dart';
import 'package:firebase_project/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'components/calendar.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key, required this.equipment}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState(equipment: equipment);
  final AvailableEquipments equipment;
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  _AppointmentScreenState({Key? key, required this.equipment});
  final List<String> sloats = [
    "07:00", "08:00", "09:00", "10:00",
    "11:00", "12:00", "13:00", "14:00",
    "15:00", "16:00", "17:00", "18:00",
  ];

  final AvailableEquipments equipment;

  int selectedSloats = 0;

  void bookAppointment(String time){
     time = time.replaceAll(":", "");
    FirebaseFirestore.instance
        .collection(FirestoreConstants.pathUserCollection)
        .doc(currentUser!.id).collection(FirestoreConstants.pathAppointmentsCollection)
        .doc(equipment.id).set({
          FirestoreConstants.typeOfEquipment: equipment.typeOfEquipment,
          FirestoreConstants.region: equipment.region,
          FirestoreConstants.id: equipment.id,
          "isConfirmed": false,
          "isDone": false,
          "time": dateOfApp + " " + time
          //"appointmentDate": "${_date.year}${_date.month}${_date.day}",
        });
    FirebaseFirestore.instance
        .collection(FirestoreConstants.pathUserCollection)
        .doc(equipment.id).collection(FirestoreConstants.pathAppointmentsCollection)
        .doc(currentUser!.id).set({
      FirestoreConstants.username: currentUser!.username,
      FirestoreConstants.region: equipment.region,
      FirestoreConstants.id: equipment.id,
      "isConfirmed": false,
      "isDone": false,
      "time": dateOfApp + " " + time
      //"appointmentDate": "${_date.year}${_date.month}${_date.day}",
    });
  }

  @override
  Widget build(BuildContext context) {
    /*DateTime now = DateTime.now();
    List<String> avsloats = [];
    if(dateOfApp == DateFormat('yyyyMMdd').format(now)) {
      for (int i = 0; i < sloats.length; i++) {
        String tim = '${now.hour}${now.minute}';
        String avtim = sloats[i].replaceAll(":", "");
        if (int.parse(tim) <= int.parse(avtim))
          avsloats.add(sloats[i]);
      }
    }
    else
      avsloats = sloats;*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Calendar(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Slots",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: sloats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.77,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSloats = index;
                    //print(selectedSloats);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedSloats == index ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Text(
                    sloats[index],
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color:
                            selectedSloats == index ? Colors.white : textColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                bookAppointment(sloats[selectedSloats]);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(),),);
              },
              child: Text("Confirm  Appoinment"),
            ),
          ),
        ],
      ),
    );
  }
}
