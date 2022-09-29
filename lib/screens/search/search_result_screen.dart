import 'package:firebase_project/components/section_title.dart';
import 'package:firebase_project/constants.dart';
import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/models/SearchEquipments.dart';
import 'package:firebase_project/screens/chat/chats_page.dart';
import 'package:firebase_project/screens/details/equipment_details_screen.dart';
import 'package:firebase_project/screens/home/components/available_doctors.dart';
import 'package:firebase_project/screens/home/components/recommended_equipments_card.dart';
import 'package:firebase_project/screens/home/components/recommended_equipments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'components/search_equipments_card.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Selected area",
              style: Theme.of(context).textTheme.caption,
            ),
            Text("Almaty"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ChatsPage(),
              ),
            ),
            icon: SvgPicture.asset("assets/icons/Chat.svg"),
          )
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  children: [
                    SectionTitle(
                      title: "All Categories",
                      pressOnSeeAll: () {},
                    ),
                    ...List.generate(
                      demoAvailableEquipments.length,
                      (index) => SearchEquipmentsCard(
                        info: demoAvailableEquipments[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentDetailsScreen(equipments: demoAvailableEquipments[index]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AvailableDoctors(),
            ],
          ),
        ),
      ),
    );
  }
}
