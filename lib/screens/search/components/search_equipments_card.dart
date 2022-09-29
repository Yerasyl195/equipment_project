import 'package:firebase_project/models/AvailableEquipment.dart';
import 'package:firebase_project/models/SearchEquipments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';

class SearchEquipmentsCard extends StatelessWidget {
  const SearchEquipmentsCard({
    Key? key,
    required this.info,
    required this.press,
    //this.dateFormat = DateFormat("dd.MM.yy"),
  }) : super(key: key);

  final AvailableEquipments info;
  final VoidCallback press;
  //final now = DateTime.now();
  String getDate(){
    DateFormat dateFormat = DateFormat("dd.MM.yy");
    return dateFormat.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
      ),
      child: ListTile(
        onTap: press,
        contentPadding: EdgeInsets.all(defaultPadding),
        leading: AspectRatio(
          aspectRatio: 0.85,
          child: Image.asset(
            info.image!,
            height: 25,
            width: 25,
            //fit: BoxFit.cover,
          ),
        ),
        title: Row(
          children: [
            Text(
              info.equipmentModel!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
              child: Text(
                info.typeOfEquipment!,
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/Clock.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 4),
                  child: Text(
                    getDate(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 4),
                  child: SvgPicture.asset("assets/icons/location_pin.svg"),
                ),
                Expanded(
                  child: Text(
                    info.region!,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
