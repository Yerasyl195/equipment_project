class SearchEquipments {
  final String? image, name, speciality, time, hospitalName;

  SearchEquipments(
      {this.image, this.name, this.speciality, this.time, this.hospitalName});
}

List<SearchEquipments> demo_search_doctors = [
  SearchEquipments(
    image: "assets/images/tehnika.png",
    name: "Murzabekov Sultan",
    speciality: "Trucks",
    time: "10.09.2022",
    hospitalName: "Kazakhstan, Almaty",
  ),
  SearchEquipments(
    image: "assets/images/Caterpillar.png",
    name: "Karabash Radimir",
    speciality: "Bulldozers",
    time: "11.09.2022",
    hospitalName: "Kazakhstan, Almaty",
  ),
  SearchEquipments(
    image: "assets/images/bulldozer.png",
    name: "Yakovlev Ruslan",
    speciality: "Bulldozers",
    time: "14.09.2022",
    hospitalName: "Kazakhstan, Nur-Sultan",
  ),
  SearchEquipments(
    image: "assets/images/veh.png",
    name: "Makhmutov Ansar",
    speciality: "Roller",
    time: "12.09.2022",
    hospitalName: "Kyrgyzstan, Bishkek",
  ),
];
