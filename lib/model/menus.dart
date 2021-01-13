import 'drinks.dart';
import 'foods.dart';

class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Foods> foods;
  List<Drinks> drinks;

  Menus.fromJson(Map<String, dynamic> json) {
    foods = new List<Foods>();
    json['foods'].forEach((v) {
      foods.add(new Foods.fromJson(v));
    });

    drinks = new List<Drinks>();
    json['drinks'].forEach((v) {
      drinks.add(new Drinks.fromJson(v));
    });
  }
}