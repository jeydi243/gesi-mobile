part of values;

class FoodIcon {
  static IconData getIcon(String icon) {
    switch (icon.toLowerCase()) {
      case "pizza":
        return MdiIcons.pizza;

      case "plat":
        return MdiIcons.food;

      case "boisson":
        return MdiIcons.foodForkDrink;

      case "dessert":
        return MdiIcons.foodApple;

      case "cream":
        return MdiIcons.iceCream;

      default:
        return MdiIcons.hamburger;
    }
  }
}
