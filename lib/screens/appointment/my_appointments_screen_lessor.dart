import 'package:firebase_project/constants.dart';
import 'package:flutter/material.dart';

class MyAppointmentLessorScreen extends StatelessWidget {
  const MyAppointmentLessorScreen({Key? key}) : super(key: key);

  static final DateTime _date = DateTime.now();

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointments"),
      ),
     body: SafeArea(
        child: StreamBuilder(stream: FirebaseFirestore.instance
          .collection(FirestoreConstants.pathUserCollection)
          .doc(currentUser!.id)
          .collection(FirestoreConstants.pathAppointmentsCollection)
          .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        ...List.generate(
                          snapshot.data!.docs.length,
                              (index) => MyAppointmentForm(document: snapshot.data!.docs[index],
                            /*press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EquipmentDetailsScreen(equipments: demoAvailableEquipments[index]),
                              ),
                            ),*/
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: Text("No Appointments"),);
        }),

    ),
    );

    /*
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointments"),
      ),
      body: SafeArea(
        child: StreamBuilder(stream: FirebaseFirestore.instance
            .collection(FirestoreConstants.pathUserCollection)
            .doc(currentUser!.id)
            .collection(FirestoreConstants.pathAppointmentsCollection)
            .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasData){
                //AppoinmentRenting appoinment = AppoinmentRenting.fromDocument(snapshot.data!.docs[index]);
                return SingleChildScrollView(
                  //scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      snapshot.data!.docs.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: MyAppointmentForm(document: snapshot.data!.docs[index],),
                      ),

                    ),

                  ),
                );
              }
              return Center(child: Text("No Appoiments"),);
            }),
        */
        /*child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(defaultPadding / 2)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo("Date",
                              "${_date.day}/${_date.month}/${_date.year}"),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("Time", "10.30 Pm"),
                        ),
                        Expanded(
                          child:
                          buildAppointmentInfo("Provider", "Murzabekov Sultan"),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo(
                            "Type",
                            "Bulldozer",
                          ),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("Place", "Almaty"),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style:
                            TextButton.styleFrom(backgroundColor: redColor),
                            child: Text("Cancel"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),*/
      //),
    //);
  }
  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {

      AppoinmentRenting appoinment = AppoinmentRenting.fromDocument(document);
      DateTime time = DateTime.parse(appoinment.time);
      DateTime now = DateTime.now();
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: buildAppointmentInfo("Date",
                    "${now.day}/${now.month}/${now.year}"),
              ),
              Expanded(
                child: buildAppointmentInfo("Time", "${now.hour}:${now.minute}"),
              ),
              Expanded(
                child:
                buildAppointmentInfo("Provider", "Murzabekov Sultan"),
              ),
            ],
          ),
          Divider(height: defaultPadding * 2),
          Row(
            children: [
              Expanded(
                child: buildAppointmentInfo(
                  "Тип",
                  appoinment.typeOfEquipment,
                ),
              ),
              Expanded(
                child: buildAppointmentInfo("Место", appoinment.region),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style:
                  TextButton.styleFrom(backgroundColor: redColor),
                  child: Text("Cancel"),
                ),
              ),
            ],
          ),
        ],
      );
    }
    return SizedBox.shrink();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Appointments"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(defaultPadding / 2)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo("Дата",
                              "${_date.day}/${_date.month}/${_date.year}"),
                        ),
                        Expanded(
                          child: buildAppointmentInfo("Время", "11.00"),
                        ),
                        Expanded(
                          //child:
                          //  buildAppointmentInfo("Исполнитель", "М. Азат"),
                          child: ElevatedButton(
                            onPressed: () {
                              //return Center(child: Text("No Appointments"));
                            },
                            style:
                            TextButton.styleFrom(backgroundColor: Colors.green),
                            child: Text("Принять"),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: defaultPadding * 2),
                    Row(
                      children: [
                        Expanded(
                          child: buildAppointmentInfo(
                            "Место",
                            "Астана",
                          ),
                        ),
                        /*
                        Expanded(
                          child: buildAppointmentInfo("Место", "Астана"),
                        ),*/
                        Expanded(
                          child:
                          buildAppointmentInfo("Заказчик", "Б. Шахназар"),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              //return Center(child: Text("No Appointments"));
                            },
                            style:
                            TextButton.styleFrom(backgroundColor: redColor),
                            child: Text("Cancel"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async{
                    //Navigator.pushReplacement(
                      //context,
                      //MaterialPageRoute(
                        //builder: (context) => SplashScreen(),
                      //),);
                  },
                  child: Text("Отследить"),
                ),
              ),*/
            ],
          ),
        ),

      ),

    );
  }
  Column buildAppointmentInfo(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: textColor.withOpacity(0.62),
          ),
        ),
        Text(
          text,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}