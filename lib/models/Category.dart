class Category {
  final String icon, title;

  const Category({required this.icon, required this.title});
}

const List<Category> demo_categories = [
  Category(icon: "assets/icons/excavator.png", title: "Эксковаторы"),
  Category(icon: "assets/icons/bulldozer.png", title: "Бульдозеры"),
  Category(icon: "assets/icons/tipper-truck.png", title: "Самосвалы"),
  Category(icon: "assets/icons/construction-crane.png", title: "Hoisting"),
];
