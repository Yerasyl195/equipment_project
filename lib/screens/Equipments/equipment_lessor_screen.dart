import 'package:firebase_project/components/custom_app_bar.dart';
import 'package:firebase_project/components/heightlight.dart';
import 'package:firebase_project/components/rating.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/models/MyEquipments.dart';
import 'package:firebase_project/screens/Equipments/add_equipment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EquipmentLessorScreen extends StatelessWidget {
  const EquipmentLessorScreen({Key? key}) : super(key: key);
  
  
  String getImage(String type){
    String path = "assets/images/";
    if(type == "Бульдозер")
      return path+"bulldozer.png";

    else if(type == "Каток")
      return path+"veh.png";

    else if(type == "Погрузчик")
      return path+"ekskovatori.png";

    else if(type == "Самосвал")
      return path+"tehnika.png";

    else if(type == "Экскаватор")
      return path+"ekskov.png";

    return "";
  }
  
  
  @override
  Widget build(BuildContext context) {
    return myEquipment != null
        ? Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(text: "Моя", title: "Техника"),
              Image.asset(getImage(myEquipment!.typeOfEquipment)),
              SizedBox(height: 10),
              Text(
                "Тип техники: " + myEquipment!.typeOfEquipment,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "Модель техники: " + myEquipment!.equipmentModel,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text('Казахстан, '+myEquipment!.region),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Rating(score: 5),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "Описание техники",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(myEquipment!.equipmentDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Highlight(
                      name: "Выполнено \nзаказов",
                      text: myEquipment!.orderAmount.toString(),
                    ),
                    Highlight(
                      name: "Цена",
                      text: myEquipment!.price,
                    ),
                    Highlight(
                      name: "Оценено",
                      text: "0",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Редактировать"),
                ),
              ),
            ],
          ),
        ),
      ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Text(
                              "My Equipments".toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            const Text("Your equipments will appear here")
                          ],
                        ),
                        SizedBox(
                          width: 40,
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddEquipmentScreen(),
                              ),
                            ),
                            child: SvgPicture.asset(
                              getImage(myEquipment!.typeOfEquipment),
                              color: const Color(0xFF7DA6FF),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 90),
                  Image.asset(
                    "assets/icons/empty.png",
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
  }
}
