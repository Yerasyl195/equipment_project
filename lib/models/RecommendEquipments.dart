class RecommendedEquipments {
  final String name, speciality, institute, image;

  const RecommendedEquipments({
    required this.name,
    required this.speciality,
    required this.institute,
    required this.image,
  });
}

const List<RecommendedEquipments> demo_recommended_doctor = [
  RecommendedEquipments(
    name: "Murzabekov Sultan",
    speciality: "Trucks",
    institute: "Kazakhstan, Almaty",
    image: "assets/images/tehnika.png",
  ),
  RecommendedEquipments(
    name: "Karabash Radimir",
    speciality: "Bulldozers",
    institute: "Kazakhstan, Almaty",
    image: "assets/images/Caterpillar.png",
  ),
  RecommendedEquipments(
    name: "Yakovlev Ruslan",
    speciality: "Bulldozers",
    institute: "Kazakhstan, Nur-Sultan",
    image: "assets/images/bulldozer.png",
  ),
  RecommendedEquipments(
    name: "Makhmutov Ansar",
    speciality: "Roller",
    institute: "Kyrgyzstan, Bishkek",
    image: "assets/images/veh.png",
  ),
  RecommendedEquipments(
    name: "Meirzhan Azat",
    speciality: "Excavators",
    institute: "Kazakhstan, Turkistan",
    image: "assets/images/ekskovatori.png",
  ),
];
